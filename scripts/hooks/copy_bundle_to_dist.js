const fse = require('fs-extra');
const path = require('path');
const glob = require('glob');

const projectRoot = path.resolve(__dirname, '../../');
const distDir = path.join(projectRoot, 'dist');

// Clean dist directory
fse.emptyDirSync(distDir);

// Copy bundle JS and map
const bundleSrc = path.join(projectRoot, 'web', 'components', 'custom-pack.bundle.js');
const bundleMapSrc = path.join(projectRoot, 'web', 'components', 'custom-pack.bundle.js.map');
fse.copySync(bundleSrc, path.join(distDir, 'custom-pack.bundle.js'));
if (fse.existsSync(bundleMapSrc)) {
  fse.copySync(bundleMapSrc, path.join(distDir, 'custom-pack.bundle.js.map'));
}

// Copy CSS files, preserving structure under custom-pack/
const cssFiles = glob.sync('src/components/custom-pack/*/*.css');
cssFiles.forEach(srcFile => {
  const relPath = path.relative('src/components', srcFile); // custom-pack/custom-checkbox-set/...
  const destFile = path.join(distDir, relPath);
  fse.ensureDirSync(path.dirname(destFile));
  fse.copySync(srcFile, destFile);
});

// Copy component.json files for each component
const componentJsonFiles = glob.sync('src/components/custom-pack/*/component.json');
componentJsonFiles.forEach(srcFile => {
  const relPath = path.relative('src/components', srcFile); // e.g., custom-pack/oj-gt-comment/component.json
  const destFile = path.join(distDir, relPath);
  fse.ensureDirSync(path.dirname(destFile));
  fse.copySync(srcFile, destFile);
});

// Copy i18n files from all components to dist/resources/nls/
const i18nFiles = glob.sync('src/components/custom-pack/*/resources/nls/root/*.ts'); // or *.js if you have JS
i18nFiles.forEach(srcFile => {
  // Get the filename only (e.g., custom-checkbox-set-strings.ts)
  const fileName = path.basename(srcFile);
  const destDir = path.join(distDir, 'resources', 'nls');
  fse.ensureDirSync(destDir);
  fse.copySync(srcFile, path.join(destDir, fileName));
});

// Creating placeholders for -strings.js files
const nlsDir = path.join(distDir, 'resources', 'nls');
fse.ensureDirSync(nlsDir);

const nlsFiles = [
  'custom-checkbox-set-strings.js',
  'custom-comments-strings.js',
  'custom-single-select-strings.js',
  'oj-gt-comment-strings.js',
  'oj-gt-button-group-strings.js',
];

nlsFiles.forEach(file => {
  const filePath = path.join(nlsDir, file);
  if (!fse.existsSync(filePath)) {
    fse.writeFileSync(
      filePath,
      `define([], function() { return {}; });\n`
    );
  }
});

console.log('Dist folder prepared with required structure and files.');