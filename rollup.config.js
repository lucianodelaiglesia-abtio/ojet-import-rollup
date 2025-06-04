import resolve from '@rollup/plugin-node-resolve';
import commonjs from '@rollup/plugin-commonjs';
import babel from '@rollup/plugin-babel';
import { terser } from 'rollup-plugin-terser';
import typescript from '@rollup/plugin-typescript';

export default {
  input: 'src/components/custom-pack/index.ts',
  output: {
    file: 'web/components/custom-pack.bundle.js',
    format: 'amd',
    name: 'CustomPack',
    sourcemap: true
  },
  external: ['ojs/ojcore',
    'knockout',
    /^ojs\//,
    /^css!/
 ],
  plugins: [
    resolve(),
    commonjs(),
    typescript({ tsconfig: './tsconfig.rollup.json' }),
    babel({
      babelHelpers: 'bundled',
      presets: [['@babel/preset-env', { targets: { esmodules: false }, modules: false }]],
      exclude: 'node_modules/**'
    }),
    terser()
  ] 
};
