import { ExtendGlobalProps, registerCustomElement } from "ojs/ojvcomponent";
import { ComponentProps, ComponentType } from "preact";
//import componentStrings = require("ojL10n!./resources/nls/oj-gt-button-group-strings");
import "css!custom-pack/oj-gt-button-group/oj-gt-button-group-styles.css";
import "ojs/ojbutton";

declare function require(modules: string[], callback: (strings: any) => void): void;

let componentStrings: any = {};
if (typeof require === 'function') {
  require(['ojL10n!./resources/nls/oj-gt-button-group-strings'], (strings: any) => {
    componentStrings = strings;
  });
}

type ButtonItem = {
  label: string;
  actionName: string;
};

type Props = Readonly<{
  buttons?: ButtonItem[];
}>;

/**
 * @ojmetadata pack "custom-pack"
 * @ojmetadata version "1.0.0"
 * @ojmetadata displayName "Button group"
 * @ojmetadata description "Render a group of buttons with custom actions"
 * 
 */

function OjGtButtonGroupImpl({ buttons = [
//    { label: "Save", actionName: "save" },
//    { label: "Delete", actionName: "delete" },
//    { label: "Cancel", actionName: "cancel" }
  ] }: Props) {
  const actionMap: Record<string, () => void> = {
    save: () => console.log("Saved!"),
    cancel: () => console.log("Canceled!"),
    delete: () => console.log("Deleted!")
  };
  
  console.log("Buttons prop:", buttons);

  if (buttons.length === 0) {
    return <div className="oj-gt-button-group">No buttons to show</div>;
  }

  return (
    <div className="oj-gt-button-group">
      <br />
      <br />
      {buttons.map((btn, index) => (
        <button
          className="oj-button"
          key={index}
          onClick={() =>
            actionMap[btn.actionName]?.() ?? console.warn(`Action '${btn.actionName}' not defined`)
          }
        >
          {btn.label}
        </button>
      ))}
    </div>
  );
}

export const OjGtButtonGroup: ComponentType<
  ExtendGlobalProps<ComponentProps<typeof OjGtButtonGroupImpl>>
> = registerCustomElement("custom-pack-oj-gt-button-group", OjGtButtonGroupImpl);