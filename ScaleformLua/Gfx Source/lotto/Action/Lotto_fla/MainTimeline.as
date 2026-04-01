package Lotto_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var buy:MovieClip;
        public var buyList:MovieClip;
        public var result:MovieClip;
        public var tab:ButtonBar;
        public var btnHelp:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnHelp_Scene1_Tab_0();
            this.__setProp_tab_Scene1_Tab_0();
            return;
        }// end function

        function __setProp_btnHelp_Scene1_Tab_0()
        {
            try
            {
                this.btnHelp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp.autoRepeat = false;
            this.btnHelp.autoSize = "none";
            this.btnHelp.enabled = true;
            this.btnHelp.focusable = false;
            this.btnHelp.groupName = "";
            this.btnHelp.label = "?";
            this.btnHelp.overlayAlign = "none";
            this.btnHelp.overlayImg = "";
            this.btnHelp.overlayPadding = {x:0, y:0};
            this.btnHelp.selected = false;
            this.btnHelp.toggle = false;
            this.btnHelp.visible = true;
            try
            {
                this.btnHelp["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tab_Scene1_Tab_0()
        {
            try
            {
                this.tab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tab.autoSize = "none";
            this.tab.buttonWidth = 180;
            this.tab.direction = "horizontal";
            this.tab.enabled = true;
            this.tab.focusable = false;
            this.tab.itemRendererName = "TabButton";
            this.tab.spacing = 2;
            this.tab.visible = true;
            try
            {
                this.tab["componentInspectorSetting"] = false;
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
