const express = require('express');
const path = require('path');
const app = express();

const distDir = path.join(__dirname, 'dist');
app.use(express.static(distDir));
app.use('/custom-pack', express.static(path.join(distDir, 'custom-pack')));
app.use('/resources', express.static(path.join(distDir, 'resources')));

app.listen(3000, () => {
  console.log('Server running at http://localhost:3000/');
});