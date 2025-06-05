import { ExtendGlobalProps, registerCustomElement } from "ojs/ojvcomponent";
import { ComponentProps, ComponentType } from "preact";
//import componentStrings = require("ojL10n!./resources/nls/custom-checkbox-set-strings");
import "css!custom-pack/custom-checkbox-set/custom-checkbox-set-styles.css";
import ArrayDataProvider from "ojs/ojarraydataprovider";
import 'ojs/ojcheckboxset';
import 'ojs/ojoption';

declare function require(modules: string[], callback: (strings: any) => void): void;

let componentStrings: any = {};
if (typeof require === 'function') {
  require(['ojL10n!./resources/nls/custom-checkbox-set-strings'], (strings: any) => {
    componentStrings = strings;
  });
}

type Option = { value: string; label: string };
type Props = Readonly<{
  label?: string;
  options?: Option[];
  value?: string[];
}>;

/**
 * @ojmetadata pack "custom-pack"
 * @ojmetadata version "1.0.0"
 * @ojmetadata displayName "Custom Checkbox Set"
 * @ojmetadata description "A simple checkbox set component using oj-checkboxset"
 */
function CustomCheckboxSetImpl({
  label = "Choose options:",
  options = [
    { value: "A", label: "Option A" },
    { value: "B", label: "Option B" },
    { value: "C", label: "Option C" }
  ],
  value = []
}: Props) {
  return (
    <oj-collapsible expanded={true}>
      <h3 slot="header">{label}</h3>
      <oj-checkboxset label-hint={label} value={value}>
        {options.map((opt) => (
          <oj-option key={opt.value} value={opt.value}>
            {opt.label}
          </oj-option>
        ))}
      </oj-checkboxset>
    </oj-collapsible>
  );
}

export const CustomCheckboxSet: ComponentType<
  ExtendGlobalProps<ComponentProps<typeof CustomCheckboxSetImpl>>
> = registerCustomElement(
  "custom-pack-custom-checkbox-set",
  CustomCheckboxSetImpl
);