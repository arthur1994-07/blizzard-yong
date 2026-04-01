package 
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class Alliance extends MovieClip
    {
        public var item1:ItemRenderer_ClubList;
        public var item2:ItemRenderer_ClubList;
        public var item3:ItemRenderer_ClubList;
        public var item4:ItemRenderer_ClubList;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;

        public function Alliance()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_Alliance_TileList_0();
            this.__setProp_scrollBar_Alliance_ScrollBar_0();
            this.__setProp_item1_Alliance_Renderers_0();
            this.__setProp_item2_Alliance_Renderers_0();
            this.__setProp_item3_Alliance_Renderers_0();
            this.__setProp_item4_Alliance_Renderers_0();
            return;
        }// end function

        function __setProp_list_Alliance_TileList_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = false;
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

        function __setProp_scrollBar_Alliance_ScrollBar_0()
        {
            try
            {
                this.scrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollBar.enabled = true;
            this.scrollBar.minThumbSize = 10;
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

        function __setProp_item1_Alliance_Renderers_0()
        {
            try
            {
                this.item1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item1.autoRepeat = false;
            this.item1.autoSize = "none";
            this.item1.enabled = true;
            this.item1.groupName = "";
            this.item1.label = "";
            this.item1.overlayAlign = "none";
            this.item1.overlayImg = "";
            this.item1.overlayPadding = {x:0, y:0};
            this.item1.selected = false;
            this.item1.toggle = false;
            this.item1.usePrevLabel = false;
            this.item1.visible = true;
            try
            {
                this.item1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item2_Alliance_Renderers_0()
        {
            try
            {
                this.item2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item2.autoRepeat = false;
            this.item2.autoSize = "none";
            this.item2.enabled = true;
            this.item2.groupName = "";
            this.item2.label = "";
            this.item2.overlayAlign = "none";
            this.item2.overlayImg = "";
            this.item2.overlayPadding = {x:0, y:0};
            this.item2.selected = false;
            this.item2.toggle = false;
            this.item2.usePrevLabel = false;
            this.item2.visible = true;
            try
            {
                this.item2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item3_Alliance_Renderers_0()
        {
            try
            {
                this.item3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item3.autoRepeat = false;
            this.item3.autoSize = "none";
            this.item3.enabled = true;
            this.item3.groupName = "";
            this.item3.label = "";
            this.item3.overlayAlign = "none";
            this.item3.overlayImg = "";
            this.item3.overlayPadding = {x:0, y:0};
            this.item3.selected = false;
            this.item3.toggle = false;
            this.item3.usePrevLabel = false;
            this.item3.visible = true;
            try
            {
                this.item3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item4_Alliance_Renderers_0()
        {
            try
            {
                this.item4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item4.autoRepeat = false;
            this.item4.autoSize = "none";
            this.item4.enabled = true;
            this.item4.groupName = "";
            this.item4.label = "";
            this.item4.overlayAlign = "none";
            this.item4.overlayImg = "";
            this.item4.overlayPadding = {x:0, y:0};
            this.item4.selected = false;
            this.item4.toggle = false;
            this.item4.usePrevLabel = false;
            this.item4.visible = true;
            try
            {
                this.item4["componentInspectorSetting"] = false;
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
