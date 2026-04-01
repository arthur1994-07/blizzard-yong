package BasicChat_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var log:BasicChatLog_v2;
        public var TextSizeIncrease:Button_increase;
        public var TextSizeDecrease:Button_decrease;
        public var tab:ButtonBar;
        public var input:TextInput;
        public var comboSymbol:DropdownMenu;
        public var btnOption:Button;
        public var btnChatMacro:Button;
        public var btnResize:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_tab_Scene1_tab_0();
            this.__setProp_input_Scene1_input_0();
            this.__setProp_comboSymbol_Scene1_input_0();
            this.__setProp_btnOption_Scene1_iconBtn_0();
            this.__setProp_btnChatMacro_Scene1_iconBtn_0();
            this.__setProp_btnResize_Scene1_iconBtn_0();
            return;
        }// end function

        function __setProp_tab_Scene1_tab_0()
        {
            try
            {
                this.tab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tab.autoSize = "none";
            this.tab.buttonWidth = 62;
            this.tab.direction = "horizontal";
            this.tab.enabled = true;
            this.tab.focusable = true;
            this.tab.itemRendererName = "TabButton";
            this.tab.spacing = 1;
            this.tab.visible = true;
            try
            {
                this.tab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_input_Scene1_input_0()
        {
            try
            {
                this.input["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.input.defaultText = "";
            this.input.displayAsPassword = false;
            this.input.editable = true;
            this.input.enabled = true;
            this.input.focusable = true;
            this.input.maxByte = 100;
            this.input.maxChars = 0;
            this.input.OnlyNumber = false;
            this.input.Restrict = "all";
            this.input.RestrictAddOn = "";
            this.input.text = "";
            this.input.textAlign = "left";
            this.input.visible = true;
            try
            {
                this.input["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboSymbol_Scene1_input_0()
        {
            try
            {
                this.comboSymbol["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboSymbol.autoSize = "none";
            this.comboSymbol.dropdown = "DefaultScrollingList";
            this.comboSymbol.enabled = true;
            this.comboSymbol.focusable = false;
            this.comboSymbol.groupName = "";
            this.comboSymbol.itemRenderer = "DefaultListItemRenderer";
            this.comboSymbol.menuDirection = "up";
            this.comboSymbol.menuMargin = 1;
            this.comboSymbol.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboSymbol.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboSymbol.menuRowCount = 8;
            this.comboSymbol.menuRowsFixed = true;
            this.comboSymbol.menuWidth = 200;
            this.comboSymbol.menuWrapping = "normal";
            this.comboSymbol.overlayAlign = "none";
            this.comboSymbol.overlayImg = "";
            this.comboSymbol.overlayPadding = {x:0, y:0};
            this.comboSymbol.scrollBar = "DefaultScrollBar";
            this.comboSymbol.inspectableThumbOffset = {top:0, bottom:0};
            this.comboSymbol.visible = true;
            try
            {
                this.comboSymbol["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnOption_Scene1_iconBtn_0()
        {
            try
            {
                this.btnOption["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOption.autoRepeat = false;
            this.btnOption.autoSize = "none";
            this.btnOption.enabled = true;
            this.btnOption.focusable = false;
            this.btnOption.groupName = "";
            this.btnOption.label = "";
            this.btnOption.overlayAlign = "none";
            this.btnOption.overlayImg = "";
            this.btnOption.overlayPadding = {x:0, y:0};
            this.btnOption.selected = false;
            this.btnOption.toggle = false;
            this.btnOption.visible = true;
            try
            {
                this.btnOption["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnChatMacro_Scene1_iconBtn_0()
        {
            try
            {
                this.btnChatMacro["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnChatMacro.autoRepeat = false;
            this.btnChatMacro.autoSize = "none";
            this.btnChatMacro.enabled = true;
            this.btnChatMacro.focusable = false;
            this.btnChatMacro.groupName = "";
            this.btnChatMacro.label = "";
            this.btnChatMacro.overlayAlign = "none";
            this.btnChatMacro.overlayImg = "";
            this.btnChatMacro.overlayPadding = {x:0, y:0};
            this.btnChatMacro.selected = false;
            this.btnChatMacro.toggle = false;
            this.btnChatMacro.visible = true;
            try
            {
                this.btnChatMacro["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnResize_Scene1_iconBtn_0()
        {
            try
            {
                this.btnResize["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnResize.autoRepeat = false;
            this.btnResize.autoSize = "none";
            this.btnResize.enabled = true;
            this.btnResize.focusable = false;
            this.btnResize.groupName = "";
            this.btnResize.label = "";
            this.btnResize.overlayAlign = "none";
            this.btnResize.overlayImg = "";
            this.btnResize.overlayPadding = {x:0, y:0};
            this.btnResize.selected = true;
            this.btnResize.toggle = false;
            this.btnResize.visible = true;
            try
            {
                this.btnResize["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
