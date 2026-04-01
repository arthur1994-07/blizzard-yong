package NPCTalk_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var pageMarket:MovieClip;
        public var pageTalk:MovieClip;
        public var pageRebuy:MovieClip;
        public var tabPage:ButtonBar;
        public var slotAD:Slot;
        public var labelAD:Label;
        public var btnAD:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_tabPage_Scene1_menu_0();
            this.__setProp_btnAD_Scene1_menu_0();
            return;
        }// end function

        function __setProp_tabPage_Scene1_menu_0()
        {
            try
            {
                this.tabPage["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tabPage.autoSize = "none";
            this.tabPage.buttonWidth = 94;
            this.tabPage.direction = "horizontal";
            this.tabPage.enabled = true;
            this.tabPage.focusable = false;
            this.tabPage.itemRendererName = "TabButton";
            this.tabPage.spacing = 2;
            this.tabPage.visible = true;
            try
            {
                this.tabPage["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnAD_Scene1_menu_0()
        {
            try
            {
                this.btnAD["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnAD.autoRepeat = false;
            this.btnAD.autoSize = "none";
            this.btnAD.enabled = true;
            this.btnAD.focusable = false;
            this.btnAD.groupName = "";
            this.btnAD.label = "";
            this.btnAD.overlayAlign = "none";
            this.btnAD.overlayImg = "";
            this.btnAD.overlayPadding = {x:0, y:0};
            this.btnAD.selected = false;
            this.btnAD.toggle = false;
            this.btnAD.visible = true;
            try
            {
                this.btnAD["componentInspectorSetting"] = false;
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
