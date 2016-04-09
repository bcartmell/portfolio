renderMesh = (function() {
  // var OrbitControls = require('three-orbit-controls')(THREE);

  var renderer = new THREE.WebGLRenderer();
  var scene = new THREE.Scene();
  var camera = new THREE.PerspectiveCamera(75, 600 / 400, 0.1, 1000);
  var material = new THREE.MeshLambertMaterial({ wireframe: false, color: 0x00ff00 });
  material.side = THREE.DoubleSide;

  // var controls = new OrbitControls(camera); // eslint-disable-line no-unused-vars

  scene.add(new THREE.AmbientLight(0x333333));

  renderer.setSize(600, 400);
  renderer.setClearColor(0x90C3D4);

  function makeBufferGeometry(verticesArr) {
    var geometry = new THREE.BufferGeometry();
    var vertices = new Float32Array(verticesArr.length * 3);
    var normals = new Float32Array(verticesArr.length * 3);

    var i, j;
    for (i = 0; i < verticesArr.length; i++) {
      for (j = 0; j < 3; j++) {
        vertices[i * 3 + j] = (verticesArr[i][j]);
      }
    }

    geometry.addAttribute('position', new THREE.BufferAttribute(vertices, 3));
    geometry.addAttribute('normal', new THREE.BufferAttribute(normals, 3));
    geometry.computeVertexNormals();
    return geometry;
  }

  camera.position.z = 12;
  camera.lookAt(scene.position);

  function addLight(position) {
    var light = new THREE.PointLight(0x777777);
    light.position.x = position.x;
    light.position.y = position.y;
    light.position.z = position.z;
    scene.add(light);
    // debugger;
  }
  addLight({ x: 0, y: 15, z: 15 });
  addLight({ x: 15, y: -15, z: 15 });
  addLight({ x: -15, y: -15, z: 15 });

  addLight({ x: 15, y: 15, z: -15 });
  addLight({ x: 0, y: -15, z: -15 });
  addLight({ x: -15, y: 15, z: -15 });

  function render() {
    requestAnimationFrame(render);
    renderer.render(scene, camera);
  }

  function findMaxValue(arr) {
    // Find maximum value of nested Arrays
    var i;
    var maxVal = 0;
    var maxI = arr.length;
    for (i = 0; i < maxI; i++) {
      var currentVal;
      if (arr[i] instanceof Array) currentVal = findMaxValue(arr[i]);
      else currentVal = arr[i];

      if (currentVal > maxVal) maxVal = Math.abs(currentVal);
    }
    return maxVal;
  }

  function setDistance(object, distance) {
    for (var axis in object.position) {
      if (object.position.hasOwnProperty(axis)) {
        if (object.position[axis] > 0) {
          object.position[axis] = distance;
        } else if (object.position[axis] < 0) {
          object.position[axis] = -distance;
        }
      }
    }
  }

  function setCameraDistance(camera, distance) {
    camera.position.x = distance;
    camera.position.y = distance;
    camera.position.z = distance;
  }

  function addModel(modelArr, parentElement) {
    var material = new THREE.MeshLambertMaterial({ wireframe: false, color: 0x00ff00 });
    material.side = THREE.DoubleSide;
    var geometry = makeBufferGeometry(modelArr);
    var maxPos = findMaxValue(modelArr) + 20;
    var model = new THREE.Mesh(geometry, material);
    var i;

    setCameraDistance(camera, maxPos);
    camera.lookAt(scene.position);

    for (i = 0; i < scene.children.length; i++) {
      if (scene.children[i] instanceof THREE.PointLight) {
        setDistance(scene.children[i], maxPos);
      }
    }

    parentElement.appendChild(renderer.domElement);
    scene.add(model);
    render();
  }

  return {
    addModel: addModel,
    setCameraZ: function (cameraZ) {
      camera.position.z = cameraZ;
    },
  };
}());
