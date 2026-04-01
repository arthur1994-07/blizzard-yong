package PostBox_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var pageHistory:MovieClip;
        public var pageReceive:MovieClip;
        public var pageSend:MovieClip;
        public var tab:ButtonBar;
        public var close:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_close_Scene1_tab_0();
            this.__setProp_tab_Scene1_tab_0();
            return;
        }// end function

        function __setProp_close_Scene1_tab_0()
        {
            try
            {
                this.close["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.close.autoRepeat = false;
            this.close.autoSize = "none";
            this.close.enabled = true;
            this.close.focusable = false;
            this.close.groupName = "";
            this.close.label = "";
            this.close.overlayAlign = "none";
            this.close.overlayImg = "";
            this.close.overlayPadding = {x:0, y:0};
            this.close.selected = false;
            this.close.toggle = false;
            this.close.visible = true;
            try
            {
                this.close["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tab_Scene1_tab_0()
        {
            try
            {
                this.tab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tab.autoSize = "none";
            this.tab.buttonWidth = 80;
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
