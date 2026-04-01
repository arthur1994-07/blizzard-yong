package 
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcLockerExpand extends MovieClip
    {
        public var btnExpand:Button;
        public var labelNum:Label;
        public var labelDate:Label;

        public function mcLockerExpand()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnExpand_mcLockerExpand_btn_0();
            this.__setProp_labelDate_mcLockerExpand_text_0();
            return;
        }// end function

        function __setProp_btnExpand_mcLockerExpand_btn_0()
        {
            try
            {
                this.btnExpand["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnExpand.autoRepeat = false;
            this.btnExpand.autoSize = "none";
            this.btnExpand.enabled = true;
            this.btnExpand.focusable = false;
            this.btnExpand.groupName = "";
            this.btnExpand.label = "";
            this.btnExpand.overlayAlign = "none";
            this.btnExpand.overlayImg = "";
            this.btnExpand.overlayPadding = {x:0, y:0};
            this.btnExpand.preventAutoSize = false;
            this.btnExpand.selected = false;
            this.btnExpand.toggle = false;
            this.btnExpand.visible = true;
            try
            {
                this.btnExpand["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelDate_mcLockerExpand_text_0()
        {
            try
            {
                this.labelDate["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelDate.autoSize = "center";
            this.labelDate.enabled = true;
            this.labelDate.text = "";
            this.labelDate.visible = true;
            try
            {
                this.labelDate["componentInspectorSetting"] = false;
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
