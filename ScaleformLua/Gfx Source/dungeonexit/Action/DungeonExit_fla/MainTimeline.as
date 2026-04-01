package DungeonExit_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelInfo:Label;
        public var btnExit:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnExit_Scene1_asset_0();
            this.__setProp_labelInfo_Scene1_asset_0();
            return;
        }// end function

        function __setProp_btnExit_Scene1_asset_0()
        {
            try
            {
                this.btnExit["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnExit.autoRepeat = false;
            this.btnExit.autoSize = "none";
            this.btnExit.enabled = true;
            this.btnExit.focusable = false;
            this.btnExit.groupName = "";
            this.btnExit.label = "";
            this.btnExit.overlayAlign = "none";
            this.btnExit.overlayImg = "";
            this.btnExit.overlayPadding = {x:0, y:0};
            this.btnExit.preventAutoSize = false;
            this.btnExit.selected = false;
            this.btnExit.toggle = false;
            this.btnExit.visible = true;
            try
            {
                this.btnExit["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelInfo_Scene1_asset_0()
        {
            try
            {
                this.labelInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelInfo.autoSize = "center";
            this.labelInfo.enabled = true;
            this.labelInfo.text = "";
            this.labelInfo.visible = true;
            try
            {
                this.labelInfo["componentInspectorSetting"] = false;
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
