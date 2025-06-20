const fs = require('fs');
const path = require('path');

const components = [
  'custom-checkbox-set',
  'custom-comments',
  'custom-single-select',
  'oj-gt-comment',
  'oj-gt-button-group',
];

components.forEach(component => {
  const inputPath = path.resolve(__dirname, `../../src/components/custom-pack/${component}/${component}.tsx.tpl`);
  const outputPath = path.resolve(__dirname, `../../src/components/custom-pack/${component}/${component}.tsx`);

  if (fs.existsSync(inputPath)) {
    let content = fs.readFileSync(inputPath, 'utf8');
    // Remove ojL10n! require/imports for Rollup build
    content = content.replace(/import\s+\w+\s+=\s+require\(["']ojL10n![^)]*\);?/g, '// [REMOVED FOR ROLLUP BUILD]');
    fs.writeFileSync(outputPath, content);
    console.log(`✔ .tsx file generated for ${component} without ojL10n!`);
  } else {
    console.warn(`⚠️  File not found: ${inputPath}`);
  }
});