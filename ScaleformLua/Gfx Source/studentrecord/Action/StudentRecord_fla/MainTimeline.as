package StudentRecord_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var AttendancePage:MovieClip;
        public var ActivityPage:MovieClip;
        public var ActivityTab:Button;
        public var AttendanceTab:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ActivityTab_Scene1_tab_0();
            this.__setProp_AttendanceTab_Scene1_tab_0();
            return;
        }// end function

        function __setProp_ActivityTab_Scene1_tab_0()
        {
            try
            {
                this.ActivityTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ActivityTab.autoRepeat = false;
            this.ActivityTab.autoSize = "none";
            this.ActivityTab.enabled = true;
            this.ActivityTab.focusable = false;
            this.ActivityTab.groupName = "";
            this.ActivityTab.label = "";
            this.ActivityTab.overlayAlign = "none";
            this.ActivityTab.overlayImg = "";
            this.ActivityTab.overlayPadding = {x:0, y:0};
            this.ActivityTab.selected = false;
            this.ActivityTab.toggle = false;
            this.ActivityTab.visible = true;
            try
            {
                this.ActivityTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_AttendanceTab_Scene1_tab_0()
        {
            try
            {
                this.AttendanceTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.AttendanceTab.autoRepeat = false;
            this.AttendanceTab.autoSize = "none";
            this.AttendanceTab.enabled = true;
            this.AttendanceTab.focusable = false;
            this.AttendanceTab.groupName = "";
            this.AttendanceTab.label = "";
            this.AttendanceTab.overlayAlign = "none";
            this.AttendanceTab.overlayImg = "";
            this.AttendanceTab.overlayPadding = {x:0, y:0};
            this.AttendanceTab.selected = false;
            this.AttendanceTab.toggle = false;
            this.AttendanceTab.visible = true;
            try
            {
                this.AttendanceTab["componentInspectorSetting"] = false;
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
