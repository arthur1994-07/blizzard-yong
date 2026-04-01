package 
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    public class AttendancePage_Day extends MovieClip
    {
        public var Item_Slot:Slot;
        public var Reward_Button:Button;

        public function AttendancePage_Day()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_Reward_Button_AttendancePage_Contents_button_0();
            return;
        }// end function

        function __setProp_Reward_Button_AttendancePage_Contents_button_0()
        {
            try
            {
                this.Reward_Button["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.Reward_Button.autoRepeat = false;
            this.Reward_Button.autoSize = "none";
            this.Reward_Button.enabled = true;
            this.Reward_Button.focusable = false;
            this.Reward_Button.groupName = "";
            this.Reward_Button.label = "DefautlButton";
            this.Reward_Button.overlayAlign = "none";
            this.Reward_Button.overlayImg = "";
            this.Reward_Button.overlayPadding = {x:0, y:0};
            this.Reward_Button.selected = false;
            this.Reward_Button.toggle = false;
            this.Reward_Button.visible = true;
            try
            {
                this.Reward_Button["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
