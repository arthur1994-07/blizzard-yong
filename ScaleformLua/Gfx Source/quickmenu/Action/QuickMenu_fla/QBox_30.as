package QuickMenu_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class QBox_30 extends MovieClip
    {
        public var ButtonQbox:QboxBtn;
        public var QBoxStage:StatusIndicator;

        public function QBox_30()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ButtonQbox_QBox_Layer1_0();
            return;
        }// end function

        function __setProp_ButtonQbox_QBox_Layer1_0()
        {
            try
            {
                this.ButtonQbox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ButtonQbox.autoRepeat = false;
            this.ButtonQbox.autoSize = "none";
            this.ButtonQbox.enabled = true;
            this.ButtonQbox.focusable = false;
            this.ButtonQbox.groupName = "";
            this.ButtonQbox.label = "ToggleButton";
            this.ButtonQbox.overlayAlign = "none";
            this.ButtonQbox.overlayImg = "";
            this.ButtonQbox.overlayPadding = {x:0, y:0};
            this.ButtonQbox.selected = false;
            this.ButtonQbox.toggle = true;
            this.ButtonQbox.visible = true;
            try
            {
                this.ButtonQbox["componentInspectorSetting"] = false;
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
