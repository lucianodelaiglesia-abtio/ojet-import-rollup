import { ExtendGlobalProps, registerCustomElement } from "ojs/ojvcomponent";
import { ComponentProps, ComponentType } from "preact";
//import componentStrings = require("ojL10n!./resources/nls/custom-single-select-strings");
import "css!custom-pack/custom-single-select/custom-single-select-styles.css";
import ArrayDataProvider from "ojs/ojarraydataprovider";
import 'ojs/ojselectsingle';

declare function require(modules: string[], callback: (strings: any) => void): void;

let componentStrings: any = {};
if (typeof require === 'function') {
  require(['ojL10n!./resources/nls/custom-single-select-strings'], (strings: any) => {
    componentStrings = strings;
  });
}

type Option = { value: string; label: string };
type Props = Readonly<{
  label?: string;
  options?: Option[];
  value?: string;
}>;

/**
 * @ojmetadata pack "custom-pack"
 * @ojmetadata version "1.0.0"
 * @ojmetadata displayName "Custom Single Select"
 * @ojmetadata description "A simple single-select dropdown using oj-select-single"
 */
function CustomSingleSelectImpl({
  label = "Select an option:",
  options = [
    { value: "A", label: "Option A" },
    { value: "B", label: "Option B" },
    { value: "C", label: "Option C" }
  ],
  value = "A"
}: Props) {
  const dataProvider = new ArrayDataProvider(options, { keyAttributes: "value" });

return (
  <oj-collapsible expanded={true}>
    <h3 slot="header">{label}</h3>
    <oj-select-single label-hint={label} value={value} data={dataProvider}></oj-select-single>
  </oj-collapsible>
);
}

export const CustomSingleSelect: ComponentType<
  ExtendGlobalProps<ComponentProps<typeof CustomSingleSelectImpl>>
> = registerCustomElement(
  "custom-pack-custom-single-select",
  CustomSingleSelectImpl
);