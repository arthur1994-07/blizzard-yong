package BuffLunchBox_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class SlotTimer_1 extends MovieClip
    {
        public var slot:Slot;
        public var bar:StatusIndicator;
        public var labelNum:Label;

        public function SlotTimer_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelNum_SlotTimer_Layer1_0();
            return;
        }// end function

        function __setProp_labelNum_SlotTimer_Layer1_0()
        {
            try
            {
                this.labelNum["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelNum.autoSize = "right";
            this.labelNum.enabled = true;
            this.labelNum.text = " ";
            this.labelNum.visible = true;
            try
            {
                this.labelNum["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this.bar, true);
            InteractiveObjectEx.setHitTestDisable(this.labelNum, true);
            return;
        }// end function

    }
}
