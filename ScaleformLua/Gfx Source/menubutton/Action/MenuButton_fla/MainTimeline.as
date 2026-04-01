package MenuButton_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var btnMenu:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnMenu_Scene1_asset_0();
            return;
        }// end function

        function __setProp_btnMenu_Scene1_asset_0()
        {
            try
            {
                this.btnMenu["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnMenu.autoRepeat = false;
            this.btnMenu.autoSize = "none";
            this.btnMenu.enabled = true;
            this.btnMenu.focusable = false;
            this.btnMenu.groupName = "";
            this.btnMenu.label = "";
            this.btnMenu.overlayAlign = "none";
            this.btnMenu.overlayImg = "";
            this.btnMenu.overlayPadding = {x:0, y:0};
            this.btnMenu.selected = false;
            this.btnMenu.toggle = false;
            this.btnMenu.visible = true;
            try
            {
                this.btnMenu["componentInspectorSetting"] = false;
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
