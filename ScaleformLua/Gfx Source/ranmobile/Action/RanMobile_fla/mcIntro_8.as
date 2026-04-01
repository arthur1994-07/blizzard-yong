package RanMobile_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcIntro_8 extends MovieClip
    {
        public var recognize:MovieClip;
        public var reward:MovieClip;
        public var intro:MovieClip;
        public var tab:ButtonBar;

        public function mcIntro_8()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_tab_mcIntro_tab_0();
            return;
        }// end function

        function __setProp_tab_mcIntro_tab_0()
        {
            try
            {
                this.tab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tab.autoSize = "none";
            this.tab.buttonWidth = 0;
            this.tab.direction = "horizontal";
            this.tab.enabled = true;
            this.tab.focusable = false;
            this.tab.itemRendererName = "TabButton";
            this.tab.spacing = 1;
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
