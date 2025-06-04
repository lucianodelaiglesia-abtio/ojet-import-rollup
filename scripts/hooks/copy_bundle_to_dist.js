const fs = require('fs');
const path = require('path');

const filesToCopy = [
  'web/components/custom-pack.bundle.js',
  'web/components/custom-pack.bundle.js.map'
];

const distDir = path.resolve(__dirname, '../../dist');
if (!fs.existsSync(distDir)) {
  fs.mkdirSync(distDir);
}

filesToCopy.forEach(file => {
  const src = path.resolve(__dirname, '../../', file);
  const dest = path.join(distDir, path.basename(file));
  fs.copyFileSync(src, dest);
  console.log(`Copied ${file} to dist/`);
});