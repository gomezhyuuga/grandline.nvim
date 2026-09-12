import { readFileSync, writeFileSync } from 'node:fs';
const src = readFileSync(process.argv[2], 'utf8');
const helmet = src.match(/<helmet>([\s\S]*?)<\/helmet>/)[1];
const body = src.match(/<\/helmet>([\s\S]*?)<\/x-dc>/)[1];
writeFileSync(process.argv[3], `<!doctype html>
<html><head><meta charset="utf-8">${helmet}</head><body>${body}</body></html>
`);
console.log('standalone ->', process.argv[3]);
