package PrivateInventory_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var highlight:MovieClip;
        public var wardrobe:MovieClip;
        public var petroom:MovieClip;
        public var carport:MovieClip;
        public var btnbarTab:ButtonBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnbarTab_Scene1_tab_0();
            return;
        }// end function

        function __setProp_btnbarTab_Scene1_tab_0()
        {
            try
            {
                this.btnbarTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnbarTab.autoSize = "none";
            this.btnbarTab.buttonWidth = 70;
            this.btnbarTab.direction = "horizontal";
            this.btnbarTab.enabled = true;
            this.btnbarTab.focusable = false;
            this.btnbarTab.itemRendererName = "TabButton";
            this.btnbarTab.spacing = 2;
            this.btnbarTab.visible = true;
            try
            {
                this.btnbarTab["componentInspectorSetting"] = false;
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
