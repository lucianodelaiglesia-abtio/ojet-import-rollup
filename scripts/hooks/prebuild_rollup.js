const fs = require('fs');
const path = require('path');

const components = [
  'custom-checkbox-set',
  'custom-comments',
  'custom-single-select'
];

components.forEach(component => {
  const inputPath = path.resolve(__dirname, `../../src/components/custom-pack/${component}/${component}.tsx.tpl`);
  const outputPath = path.resolve(__dirname, `../../src/components/custom-pack/${component}/${component}.tsx`);

  if (fs.existsSync(inputPath)) {
    let content = fs.readFileSync(inputPath, 'utf8');
    // Remove ojL10n! require/imports for Rollup build
    content = content.replace(/import\s+\w+\s+=\s+require\(["']ojL10n![^)]*\);?/g, '// [REMOVED FOR ROLLUP BUILD]');
    fs.writeFileSync(outputPath, content);
    console.log(`✔ Archivo .tsx generado para ${component} sin ojL10n!`);
  } else {
    console.warn(`⚠️  No se encontró el archivo ${inputPath}`);
  }
});