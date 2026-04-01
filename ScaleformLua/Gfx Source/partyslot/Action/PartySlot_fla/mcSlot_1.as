package PartySlot_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcSlot_1 extends MovieClip
    {
        public var mcBuff:MovieClip;
        public var mcSchool:MovieClip;
        public var imgChar:MovieClip;
        public var barHP:StatusIndicator;
        public var labelName:Label;
        public var labelHP:Label;
        public var bg:MovieClip;

        public function mcSlot_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelName_mcSlot_label_0();
            this.__setProp_labelHP_mcSlot_label_0();
            return;
        }// end function

        function __setProp_labelName_mcSlot_label_0()
        {
            try
            {
                this.labelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName.autoSize = "center";
            this.labelName.autoSizeEnable = false;
            this.labelName.enabled = true;
            this.labelName.text = "abcdefghijklmnop";
            this.labelName.visible = true;
            try
            {
                this.labelName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelHP_mcSlot_label_0()
        {
            try
            {
                this.labelHP["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelHP.autoSize = "center";
            this.labelHP.autoSizeEnable = false;
            this.labelHP.enabled = true;
            this.labelHP.text = "1234567/1234567";
            this.labelHP.visible = true;
            try
            {
                this.labelHP["componentInspectorSetting"] = false;
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
