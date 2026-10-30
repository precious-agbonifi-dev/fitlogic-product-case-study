const test = require("node:test");
const assert = require("node:assert/strict");
const handler = require("../api/coach.js");
function response() {
 return {
  statusCode:200, headers:{},
  setHeader(key,value){this.headers[key]=value},
  status(code){this.statusCode=code;return this},
  json(value){this.body=value;return this}
 };
}
test("rejects non-POST methods",async()=>{
 const res=response();await handler({method:"GET",headers:{}},res);
 assert.equal(res.statusCode,405);
});
test("rejects unsupported scenarios",async()=>{
 const res=response();await handler({method:"POST",headers:{},body:{scenario:"unknown",answer:"Hello"}},res);
 assert.equal(res.statusCode,400);
});
test("rejects long text",async()=>{
 const res=response();await handler({method:"POST",headers:{},body:{scenario:"intro",answer:"a".repeat(401)}},res);
 assert.equal(res.statusCode,400);
});
test("returns 503 when server secret is missing",async()=>{
 const old=process.env.OPENAI_API_KEY;delete process.env.OPENAI_API_KEY;
 const res=response();await handler({method:"POST",headers:{},body:{scenario:"intro",answer:"Hello, my name is Jo"}},res);
 assert.equal(res.statusCode,503);
 if(old!==undefined)process.env.OPENAI_API_KEY=old;
});
test("calls real Responses endpoint with secret on server, returns structured fields",async()=>{
 const originalFetch=global.fetch, originalKey=process.env.OPENAI_API_KEY;
 process.env.OPENAI_API_KEY="server-side-test-only";
 let called=false;
 global.fetch=async(url,options)=>{
  called=true;assert.equal(url,"https://api.openai.com/v1/responses");
  assert.equal(options.headers.Authorization,"Bearer server-side-test-only");
  const sent=JSON.parse(options.body);
  assert.equal(sent.store,false);
  assert.equal(sent.text.format.type,"json_schema");
  assert.equal(sent.input.includes("Hello, nice to meet you"),true);
  return {ok:true,json:async()=>({output:[{content:[{type:"output_text",text:JSON.stringify({
   encouragement:"Good attempt.",effective:"You greeted them.",improvement:"Add your name.",example:"Hi, I'm Jo.",follow_up:"What do you do?",needs_review:false
  })}]}]})};
 };
 try{
  const res=response();await handler({method:"POST",headers:{},body:{scenario:"intro",answer:"Hello, nice to meet you"}},res);
  assert.equal(res.statusCode,200);
  assert.equal(res.body.mode,"ai");
  assert.equal(res.body.feedback.example,"Hi, I'm Jo.");
  assert.ok(called);
 } finally {
  global.fetch=originalFetch;
  if(originalKey===undefined)delete process.env.OPENAI_API_KEY;
  else process.env.OPENAI_API_KEY=originalKey;
 }
});
