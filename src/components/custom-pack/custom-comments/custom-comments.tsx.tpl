import { ExtendGlobalProps, registerCustomElement } from "ojs/ojvcomponent";
import { ComponentProps, ComponentType } from "preact";
//import componentStrings = require("ojL10n!./resources/nls/custom-comments-strings");
import "css!custom-pack/custom-comments/custom-comments-styles.css";
import 'ojs/ojinputtext';

declare function require(modules: string[], callback: (strings: any) => void): void;

let componentStrings: any = {};
if (typeof require === 'function') {
  require(['ojL10n!./resources/nls/custom-comments-strings'], (strings: any) => {
    componentStrings = strings;
  });
}

type Props = Readonly<{
  label?: string;
}>;

/**
 * @ojmetadata pack "custom-pack"
 * @ojmetadata version "1.0.0"
 * @ojmetadata displayName "Custom Comments Box"
 * @ojmetadata description "A simple comments box using oj-input-text"
 * 
 */
function CustomCommentsImpl(
  { label = "Hello from custom-pack-custom-comments" }: Props
) {
  return (
    <oj-collapsible expanded={true}>
      <h3 slot="header">Comments Section</h3>
      <oj-input-text label-hint={label} /><br /><br />
      <oj-button id="btn" label="Add comment"></oj-button>
    </oj-collapsible>
  );
}

export const CustomComments: ComponentType <
  ExtendGlobalProps < ComponentProps < typeof CustomCommentsImpl>>
> = registerCustomElement(
    "custom-pack-custom-comments",
  CustomCommentsImpl
);