package Club_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class Locker_1 extends MovieClip
    {
        public var SlotS:MovieClip;
        public var SlotB:MovieClip;
        public var SlotC:MovieClip;
        public var SlotD:MovieClip;
        public var SlotE:MovieClip;
        public var SlotA:MovieClip;
        public var labelHistory:Label;
        public var labelInterests:Label;
        public var labelInterests_1:Label;
        public var labelBalance:Label;
        public var labelBalance_1:Label;
        public var TextAreaHistory:TextArea;
        public var scrollBarHistory:ScrollBar;
        public var optionStepper2:OptionStepper;
        public var btnGetinterests:Button;
        public var btnSave:Button;
        public var btnDraw:Button;
        public var iconMoney:UIComponent;

        public function Locker_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_TextAreaHistory_Locker_Text_0();
            this.__setProp_scrollBarHistory_Locker_Text_0();
            this.__setProp_optionStepper2_Locker_button_0();
            this.__setProp_btnDraw_Locker_button_0();
            this.__setProp_btnSave_Locker_button_0();
            return;
        }// end function

        function __setProp_TextAreaHistory_Locker_Text_0()
        {
            try
            {
                this.TextAreaHistory["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextAreaHistory.defaultText = "";
            this.TextAreaHistory.displayAsPassword = false;
            this.TextAreaHistory.editable = false;
            this.TextAreaHistory.enabled = true;
            this.TextAreaHistory.focusable = false;
            this.TextAreaHistory.maxByte = 0;
            this.TextAreaHistory.maxChars = 0;
            this.TextAreaHistory.minThumbSize = 1;
            this.TextAreaHistory.OnlyNumber = false;
            this.TextAreaHistory.scrollBar = "";
            this.TextAreaHistory.text = "";
            this.TextAreaHistory.thumbOffset = {top:0, bottom:0};
            this.TextAreaHistory.visible = true;
            try
            {
                this.TextAreaHistory["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollBarHistory_Locker_Text_0()
        {
            try
            {
                this.scrollBarHistory["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollBarHistory.enabled = true;
            this.scrollBarHistory.minThumbSize = 10;
            this.scrollBarHistory.offsetBottom = 0;
            this.scrollBarHistory.offsetTop = 0;
            this.scrollBarHistory.scrollTarget = "TextAreaHistory";
            this.scrollBarHistory.trackMode = "scrollPage";
            this.scrollBarHistory.visible = true;
            try
            {
                this.scrollBarHistory["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_optionStepper2_Locker_button_0()
        {
            try
            {
                this.optionStepper2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.optionStepper2.enabled = true;
            this.optionStepper2.focusable = false;
            this.optionStepper2.visible = true;
            try
            {
                this.optionStepper2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDraw_Locker_button_0()
        {
            try
            {
                this.btnDraw["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDraw.autoRepeat = false;
            this.btnDraw.autoSize = "none";
            this.btnDraw.enabled = true;
            this.btnDraw.focusable = false;
            this.btnDraw.groupName = "";
            this.btnDraw.label = "";
            this.btnDraw.overlayAlign = "none";
            this.btnDraw.overlayImg = "";
            this.btnDraw.overlayPadding = {x:0, y:0};
            this.btnDraw.selected = false;
            this.btnDraw.toggle = false;
            this.btnDraw.visible = true;
            try
            {
                this.btnDraw["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSave_Locker_button_0()
        {
            try
            {
                this.btnSave["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSave.autoRepeat = false;
            this.btnSave.autoSize = "none";
            this.btnSave.enabled = true;
            this.btnSave.focusable = false;
            this.btnSave.groupName = "";
            this.btnSave.label = "";
            this.btnSave.overlayAlign = "none";
            this.btnSave.overlayImg = "";
            this.btnSave.overlayPadding = {x:0, y:0};
            this.btnSave.selected = false;
            this.btnSave.toggle = false;
            this.btnSave.visible = true;
            try
            {
                this.btnSave["componentInspectorSetting"] = false;
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
