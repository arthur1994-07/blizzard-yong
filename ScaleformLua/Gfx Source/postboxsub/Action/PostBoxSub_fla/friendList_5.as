package PostBoxSub_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class friendList_5 extends MovieClip
    {
        public var item1:ListItemRenderer;
        public var item2:ListItemRenderer;
        public var item3:ListItemRenderer;
        public var item4:ListItemRenderer;
        public var item5:ListItemRenderer;
        public var item6:ListItemRenderer;
        public var item7:ListItemRenderer;
        public var item8:ListItemRenderer;
        public var item9:ListItemRenderer;
        public var item10:ListItemRenderer;
        public var item11:ListItemRenderer;
        public var item12:ListItemRenderer;
        public var item13:ListItemRenderer;
        public var item14:ListItemRenderer;
        public var scrollBar:ScrollBar;
        public var list:ScrollingList;

        public function friendList_5()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_friendList_TileList_0();
            this.__setProp_scrollBar_friendList_ScrollBar_0();
            return;
        }// end function

        function __setProp_list_friendList_TileList_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = true;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "";
            this.list.treeButtonClassName = "";
            this.list.treeButtonGap = -1;
            this.list.treeCheckBoxClassName = "";
            this.list.treeList = false;
            this.list.visible = true;
            this.list.wrapping = "normal";
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollBar_friendList_ScrollBar_0()
        {
            try
            {
                this.scrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollBar.enabled = true;
            this.scrollBar.minThumbSize = 1;
            this.scrollBar.offsetBottom = 0;
            this.scrollBar.offsetTop = 0;
            this.scrollBar.scrollTarget = "list";
            this.scrollBar.trackMode = "scrollPage";
            this.scrollBar.visible = true;
            try
            {
                this.scrollBar["componentInspectorSetting"] = false;
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
