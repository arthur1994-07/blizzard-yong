package ReportBox_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var ReportBoxList:ScrollingList;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ReportBoxList_Scene1_asset_0();
            return;
        }// end function

        function __setProp_ReportBoxList_Scene1_asset_0()
        {
            try
            {
                this.ReportBoxList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ReportBoxList.enabled = true;
            this.ReportBoxList.focusable = false;
            this.ReportBoxList.itemRendererName = "ListItemRenderer_h20";
            this.ReportBoxList.itemRendererInstanceName = "";
            this.ReportBoxList.margin = 0;
            this.ReportBoxList.multiSelect = false;
            this.ReportBoxList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.ReportBoxList.rowHeight = 20;
            this.ReportBoxList.scrollBar = "DefaultScrollBar";
            this.ReportBoxList.treeButtonClassName = "";
            this.ReportBoxList.treeButtonGap = -1;
            this.ReportBoxList.treeCheckBoxClassName = "";
            this.ReportBoxList.treeList = false;
            this.ReportBoxList.visible = true;
            this.ReportBoxList.wrapping = "normal";
            try
            {
                this.ReportBoxList["componentInspectorSetting"] = false;
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
