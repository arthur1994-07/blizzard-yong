package Product_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class ResultProductBox_8 extends MovieClip
    {
        public var ResultNumTextBox:TextField;
        public var ResultNumTextbox:Label;
        public var IsProductTextBox:Label;
        public var ReqSkillTextBox:Label;
        public var GainSkillTextBox:Label;
        public var ProductTimeTextBox:Label;
        public var ReqLevelTextBox:Label;
        public var ResultItemSlot:Slot;

        public function ResultProductBox_8()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ReqLevelTextBox_ResultProductBox_Text_0();
            return;
        }// end function

        function __setProp_ReqLevelTextBox_ResultProductBox_Text_0()
        {
            try
            {
                this.ReqLevelTextBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ReqLevelTextBox.autoSize = "right";
            this.ReqLevelTextBox.autoSizeEnable = false;
            this.ReqLevelTextBox.enabled = true;
            this.ReqLevelTextBox.text = "";
            this.ReqLevelTextBox.visible = true;
            try
            {
                this.ReqLevelTextBox["componentInspectorSetting"] = false;
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
