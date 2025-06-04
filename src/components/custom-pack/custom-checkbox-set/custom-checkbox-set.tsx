import { ExtendGlobalProps, registerCustomElement } from "ojs/ojvcomponent";
import { ComponentProps, ComponentType } from "preact";
//// [REMOVED FOR ROLLUP BUILD]
import "css!custom-pack/custom-checkbox-set/custom-checkbox-set-styles.css";

declare function require(modules: string[], callback: (strings: any) => void): void;

let componentStrings: any = {};
if (typeof require === 'function') {
  require(['ojL10n!./resources/nls/custom-checkbox-set-strings'], (strings: any) => {
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
function CustomCheckboxSetImpl(
  { message = "Hello from  custom-pack-custom-checkbox-set" }: Props
) {
  return <p>{message}</p>
}

export const CustomCheckboxSet: ComponentType <
  ExtendGlobalProps < ComponentProps < typeof CustomCheckboxSetImpl>>
> = registerCustomElement(
    "custom-pack-custom-checkbox-set",
  CustomCheckboxSetImpl
);