import { ExtendGlobalProps, registerCustomElement } from "ojs/ojvcomponent";
import { ComponentProps, ComponentType } from "preact";
//import componentStrings = require("ojL10n!./resources/nls/custom-comments-strings");
import "css!custom-pack/custom-comments/custom-comments-styles.css";

declare function require(modules: string[], callback: (strings: any) => void): void;

let componentStrings: any = {};
if (typeof require === 'function') {
  require(['ojL10n!./resources/nls/custom-comments-strings'], (strings: any) => {
    componentStrings = strings;
  });
}

type Props = Readonly<{
  message?: string;
}>;

/**
 * @ojmetadata pack "custom-pack"
 * @ojmetadata version "1.0.0"
 * @ojmetadata displayName "A user friendly, translatable name of the component"
 * @ojmetadata description "A translatable high-level description for the component"
 * 
 */
function CustomCommentsImpl(
  { message = "Hello from  custom-pack-custom-comments" }: Props
) {
  return <p>{message}</p>
}

export const CustomComments: ComponentType <
  ExtendGlobalProps < ComponentProps < typeof CustomCommentsImpl>>
> = registerCustomElement(
    "custom-pack-custom-comments",
  CustomCommentsImpl
);