'use strict';
const fs = require('fs');

function changeExt(path, newExt) {
  return path.slice(0, path.lastIndexOf('.')) + '.' + newExt;
}

function getMesh(filePath, callback) {
  const bufferPath = changeExt(filePath, 'json');
  fs.access(bufferPath, (err) => {
    if (err) {
      console.log('json not found, building mesh');
      buildMesh(filePath, callback);
    }
    else {
      console.log('json found, returning pre-built mesh');
      fs.readFile(bufferPath, callback);
    }
  });
}

function buildMesh(path, callback) {
  fs.readFile(path, (err, data) => {
    if (err) throw err;
    const mesh = JSON.stringify(parseBuffer(data));
    saveMesh(changeExt(path, 'json'), mesh);
    if (callback) callback(err, mesh);
  });
}

function saveMesh(fileName, buffer, callback) {
  fs.writeFile(fileName, buffer, (err) => {
    if (callback) callback(err, buffer);
  });
}

function parseBuffer(data) {
  let vertices = [];

  // the first 80 characters of an STL file are HEADER, which we can ignore
  // the next 4 bytes are for the facetsCount
  let facetsCount = data.readUIntLE(80,4);
  data = data.slice(84);

  console.log('facetsCount', facetsCount);

  // start at 4 because the first 4 bytes is the facet count
  // only go to length-12 because this is where the last facet starts
  for (let i=0; i<facetsCount; i++) {
    // start at 12 beacause the first 12 bytes are for the 
    // facet normal, wich THREE.js will figure out for itself.
    // we're just building a mesh, and so don't need it.
    var vertex = [];
    for (let j=12; j<=44; j+=4) {
        vertex.push(data.readFloatLE(i * 50 + j));
        if (vertex.length === 3) {
          vertices.push(vertex);
          vertex = [];
        }
    }
  }
  return vertices;
}

module.exports = function(filePath, callback) {  
  getMesh(filePath, callback);
}
