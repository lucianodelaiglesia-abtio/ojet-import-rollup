import { ExtendGlobalProps, registerCustomElement } from "ojs/ojvcomponent";
import { ComponentProps, ComponentType } from "preact";
//import componentStrings = require("ojL10n!./resources/nls/oj-gt-comment-strings");
import "css!custom-pack/oj-gt-comment/oj-gt-comment-styles.css";
import "ojs/ojformlayout";
import "ojs/ojinputtext";

declare function require(modules: string[], callback: (strings: any) => void): void;

let componentStrings: any = {};
if (typeof require === 'function') {
  require(['ojL10n!./resources/nls/oj-gt-comment-strings'], (strings: any) => {
	componentStrings = strings;
  });
}

type Props = Readonly<{
  label?: string;
  value?: string;
  rows?: number;
}>;

/**
 * @ojmetadata pack "custom-pack"
 * @ojmetadata version "1.0.0"
 * @ojmetadata displayName "Comment"
 * @ojmetadata description "Custom component to display a simple comment"
 * @ojmetadata properties {
 * "label": {
 * "type": "string"
 * },
 * "value": {
 * "type": "string",
 * "writeback": true
 * },
 * "rows": {
 * "type": "number"
 * }
 * }
 */

function OjGtCommentImpl({ label, value, rows }: Props) {
  const parsedRows = rows != null ? Number(rows) : undefined;
  
  return (
    <div class="oj-gt-comment">
      <br></br><br></br>
      <oj-form-layout>
        <oj-text-area
          labelHint={label}
          value={value}
          rows={parsedRows}
        ></oj-text-area>
      </oj-form-layout>
    </div>
  );
}

export const OjGtComment: ComponentType<
  ExtendGlobalProps<ComponentProps<typeof OjGtCommentImpl>>
> = registerCustomElement("custom-pack-oj-gt-comment", OjGtCommentImpl);