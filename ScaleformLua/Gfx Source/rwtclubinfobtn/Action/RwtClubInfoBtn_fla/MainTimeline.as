package RwtClubInfoBtn_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var btnInfo:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnInfo_Scene1_Layer1_0();
            return;
        }// end function

        function __setProp_btnInfo_Scene1_Layer1_0()
        {
            try
            {
                this.btnInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnInfo.autoRepeat = false;
            this.btnInfo.autoSize = "none";
            this.btnInfo.enabled = true;
            this.btnInfo.focusable = false;
            this.btnInfo.groupName = "";
            this.btnInfo.label = "";
            this.btnInfo.overlayAlign = "none";
            this.btnInfo.overlayImg = "";
            this.btnInfo.overlayPadding = {x:0, y:0};
            this.btnInfo.selected = false;
            this.btnInfo.toggle = false;
            this.btnInfo.visible = true;
            try
            {
                this.btnInfo["componentInspectorSetting"] = false;
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
