package RanMobile_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var reward:MovieClip;
        public var charInfo:MovieClip;
        public var mcWait:MovieClip;
        public var intro:MovieClip;
        public var tabTitle:ButtonBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_tabTitle_Scene1_tab_0();
            return;
        }// end function

        function __setProp_tabTitle_Scene1_tab_0()
        {
            try
            {
                this.tabTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tabTitle.autoSize = "none";
            this.tabTitle.buttonWidth = 0;
            this.tabTitle.direction = "horizontal";
            this.tabTitle.enabled = true;
            this.tabTitle.focusable = false;
            this.tabTitle.itemRendererName = "TabButton";
            this.tabTitle.spacing = 1;
            this.tabTitle.visible = true;
            try
            {
                this.tabTitle["componentInspectorSetting"] = false;
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
