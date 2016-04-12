renderMesh = function(meshArr, $parentElement) {

  var renderWidth = $parentElement.innerWidth();

  var renderer = new THREE.WebGLRenderer();

  var scene = new THREE.Scene();

  var camera = new THREE.PerspectiveCamera(75, 1.618, 0.1, 1000);

  var controls = new THREE.OrbitControls( camera, renderer.domElement );
  controls.enableDamping = true;
  controls.dampingFactor = 1.5;
  controls.enableZoom = false;

  var material = new THREE.MeshLambertMaterial({ wireframe: false, color: 0x00ff00 });
  material.side = THREE.DoubleSide;

  var geometry = makeBufferGeometry(meshArr);
  var model = new THREE.Mesh(geometry, material);
  var maxPos = findMaxValue(meshArr);

  scene.add(new THREE.AmbientLight(0x333333));

  renderer.setSize(renderWidth, renderWidth/1.618);
  renderer.setClearColor(0x90C3D4);

  camera.position.z = maxPos*1.5;
  camera.lookAt(scene.position);

  addLight({ x: 0, y: maxPos*2, z: maxPos*2 });
  addLight({ x: maxPos*2, y: -maxPos*2, z: maxPos*2 });
  addLight({ x: -maxPos*2, y: -maxPos*2, z: maxPos*2 });

  addLight({ x: maxPos*2, y: maxPos*2, z: -maxPos*2 });
  addLight({ x: 0, y: -maxPos*2, z: -maxPos*2 });
  addLight({ x: -maxPos*2, y: maxPos*2, z: -maxPos*2 });

  camera.lookAt(scene.position);

  $parentElement.append(renderer.domElement);
  scene.add(model);
  render();

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

  function addLight(position) {
    var light = new THREE.PointLight(0x777777);
    light.position.x = position.x;
    light.position.y = position.y;
    light.position.z = position.z;
    scene.add(light);
    // debugger;
  }
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
}
