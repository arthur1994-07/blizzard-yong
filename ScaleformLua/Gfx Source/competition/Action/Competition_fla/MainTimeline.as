package Competition_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var infoCTF:MovieClip;
        public var infoCDM:MovieClip;
        public var infoStage:MovieClip;
        public var tree:ScrollingList;
        public var tree_scrollbar:ScrollBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_tree_Scene1_Default_0();
            this.__setProp_tree_scrollbar_Scene1_Default_0();
            return;
        }// end function

        function __setProp_tree_Scene1_Default_0()
        {
            try
            {
                this.tree["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tree.enabled = true;
            this.tree.focusable = false;
            this.tree.itemRendererName = "TreeItemRenderer";
            this.tree.itemRendererInstanceName = "";
            this.tree.margin = 0;
            this.tree.multiSelect = false;
            this.tree.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.tree.rowHeight = 0;
            this.tree.scrollBar = "";
            this.tree.treeButtonClassName = "TreeButton";
            this.tree.treeButtonGap = 1;
            this.tree.treeCheckBoxClassName = "";
            this.tree.treeList = true;
            this.tree.visible = true;
            this.tree.wrapping = "normal";
            try
            {
                this.tree["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tree_scrollbar_Scene1_Default_0()
        {
            try
            {
                this.tree_scrollbar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tree_scrollbar.enabled = true;
            this.tree_scrollbar.minThumbSize = 10;
            this.tree_scrollbar.offsetBottom = 0;
            this.tree_scrollbar.offsetTop = 0;
            this.tree_scrollbar.scrollTarget = "tree";
            this.tree_scrollbar.trackMode = "scrollPage";
            this.tree_scrollbar.visible = true;
            try
            {
                this.tree_scrollbar["componentInspectorSetting"] = false;
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
