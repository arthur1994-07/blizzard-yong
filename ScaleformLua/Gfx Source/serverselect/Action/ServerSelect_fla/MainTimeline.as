package ServerSelect_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var item5:ServerSelect_LIR;
        public var item6:ServerSelect_LIR;
        public var item1:ServerSelect_LIR;
        public var item2:ServerSelect_LIR;
        public var item3:ServerSelect_LIR;
        public var item4:ServerSelect_LIR;
        public var btnExit:Button;
        public var listServer:ScrollingList;
        public var listServerScrollBar:ScrollBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_listServer_Scene1_asset_0();
            this.__setProp_btnExit_Scene1_asset_0();
            return;
        }// end function

        function __setProp_listServer_Scene1_asset_0()
        {
            try
            {
                this.listServer["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listServer.enabled = true;
            this.listServer.focusable = false;
            this.listServer.itemRendererName = "";
            this.listServer.itemRendererInstanceName = "item";
            this.listServer.margin = 0;
            this.listServer.multiSelect = false;
            this.listServer.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listServer.rowHeight = 0;
            this.listServer.scrollBar = "listServerScrollBar";
            this.listServer.treeButtonClassName = "";
            this.listServer.treeButtonGap = -1;
            this.listServer.treeCheckBoxClassName = "";
            this.listServer.treeList = false;
            this.listServer.visible = true;
            this.listServer.wrapping = "normal";
            try
            {
                this.listServer["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
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

        function frame1()
        {
            return;
        }// end function

    }
}
