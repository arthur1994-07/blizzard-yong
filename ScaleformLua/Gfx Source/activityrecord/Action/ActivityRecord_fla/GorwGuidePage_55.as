package ActivityRecord_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class GorwGuidePage_55 extends MovieClip
    {
        public var RecommendItemPage:MovieClip;
        public var Arrow1:MovieClip;
        public var Arrow2:MovieClip;
        public var Arrow3:MovieClip;
        public var Arrow4:MovieClip;
        public var Arrow5:MovieClip;
        public var Arrow6:MovieClip;
        public var Arrow7:MovieClip;
        public var RecommendField:MovieClip;
        public var RecommendPlaceText:Label;
        public var RecommendItemText:Label;
        public var RecommendPlace:RadioButton;
        public var RecommendItem:RadioButton;
        public var MapListScrollBar:ScrollBar;
        public var MapList:ScrollingList;
        public var LevelButtonList:ScrollingList;
        public var btnGo:Button;
        public var ButtonLastLevel:Button;
        public var ButtonNextLevel:Button;
        public var RecommendArrow:ListItemRenderer;
        public var ListItemRendererLvCircle:ListItemRenderer;
        public var ListItemRendererMapList:ListItemRenderer;
        public var LevelButton1:ListItemRenderer;
        public var LevelButton2:ListItemRenderer;
        public var LevelButton3:ListItemRenderer;
        public var LevelButton4:ListItemRenderer;
        public var LevelButton5:ListItemRenderer;
        public var LevelButton6:ListItemRenderer;
        public var LevelButton7:ListItemRenderer;
        public var LevelButton8:ListItemRenderer;
        public var GgMap1:ListItemRenderer;
        public var GgMap2:ListItemRenderer;
        public var GgMap3:ListItemRenderer;
        public var GgMap4:ListItemRenderer;
        public var ImageButton1:ImageButton;
        public var ImageButton2:ImageButton;
        public var ImageButton3:ImageButton;
        public var ImageButton4:ImageButton;
        public var RecommendMaplist:ScrollingList;

        public function GorwGuidePage_55()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_RecommendPlace_GorwGuidePage_LabelBtn_0();
            this.__setProp_RecommendItem_GorwGuidePage_LabelBtn_0();
            this.__setProp_RecommendMaplist_GorwGuidePage_list_0();
            this.__setProp_MapListScrollBar_GorwGuidePage_list_0();
            this.__setProp_LevelButtonList_GorwGuidePage_list_0();
            this.__setProp_LevelButton1_GorwGuidePage_slot_0();
            this.__setProp_LevelButton2_GorwGuidePage_slot_0();
            this.__setProp_LevelButton3_GorwGuidePage_slot_0();
            this.__setProp_LevelButton4_GorwGuidePage_slot_0();
            this.__setProp_LevelButton5_GorwGuidePage_slot_0();
            this.__setProp_LevelButton6_GorwGuidePage_slot_0();
            this.__setProp_LevelButton7_GorwGuidePage_slot_0();
            this.__setProp_LevelButton8_GorwGuidePage_slot_0();
            this.__setProp_GgMap1_GorwGuidePage_slot_0();
            this.__setProp_GgMap3_GorwGuidePage_slot_0();
            this.__setProp_GgMap2_GorwGuidePage_slot_0();
            this.__setProp_GgMap4_GorwGuidePage_slot_0();
            this.__setProp_RecommendArrow_GorwGuidePage_recommendArrow_0();
            return;
        }// end function

        function __setProp_RecommendPlace_GorwGuidePage_LabelBtn_0()
        {
            try
            {
                this.RecommendPlace["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RecommendPlace.autoSize = "none";
            this.RecommendPlace.enabled = true;
            this.RecommendPlace.focusable = true;
            this.RecommendPlace.groupName = "Recommend_Select";
            this.RecommendPlace.label = "RecommendPlaceText";
            this.RecommendPlace.overlayAlign = "none";
            this.RecommendPlace.overlayImg = "";
            this.RecommendPlace.overlayPadding = {x:0, y:0};
            this.RecommendPlace.selected = false;
            this.RecommendPlace.visible = true;
            try
            {
                this.RecommendPlace["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RecommendItem_GorwGuidePage_LabelBtn_0()
        {
            try
            {
                this.RecommendItem["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RecommendItem.autoSize = "none";
            this.RecommendItem.enabled = true;
            this.RecommendItem.focusable = true;
            this.RecommendItem.groupName = "Recommend_Select";
            this.RecommendItem.label = "RecommendItemText";
            this.RecommendItem.overlayAlign = "none";
            this.RecommendItem.overlayImg = "";
            this.RecommendItem.overlayPadding = {x:0, y:0};
            this.RecommendItem.selected = false;
            this.RecommendItem.visible = true;
            try
            {
                this.RecommendItem["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RecommendMaplist_GorwGuidePage_list_0()
        {
            try
            {
                this.RecommendMaplist["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RecommendMaplist.enabled = true;
            this.RecommendMaplist.focusable = false;
            this.RecommendMaplist.itemRendererName = "";
            this.RecommendMaplist.itemRendererInstanceName = "GgMap";
            this.RecommendMaplist.margin = 0;
            this.RecommendMaplist.multiSelect = false;
            this.RecommendMaplist.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.RecommendMaplist.rowHeight = 0;
            this.RecommendMaplist.scrollBar = "MapListScrollBar";
            this.RecommendMaplist.treeButtonClassName = "";
            this.RecommendMaplist.treeButtonGap = -1;
            this.RecommendMaplist.treeCheckBoxClassName = "";
            this.RecommendMaplist.treeList = false;
            this.RecommendMaplist.visible = true;
            this.RecommendMaplist.wrapping = "normal";
            try
            {
                this.RecommendMaplist["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_MapListScrollBar_GorwGuidePage_list_0()
        {
            try
            {
                this.MapListScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.MapListScrollBar.enabled = true;
            this.MapListScrollBar.minThumbSize = 2;
            this.MapListScrollBar.offsetBottom = 0;
            this.MapListScrollBar.offsetTop = 0;
            this.MapListScrollBar.scrollTarget = "RecommendMaplist";
            this.MapListScrollBar.trackMode = "scrollPage";
            this.MapListScrollBar.visible = true;
            try
            {
                this.MapListScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButtonList_GorwGuidePage_list_0()
        {
            try
            {
                this.LevelButtonList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButtonList.enabled = true;
            this.LevelButtonList.focusable = false;
            this.LevelButtonList.itemRendererName = "";
            this.LevelButtonList.itemRendererInstanceName = "LevelButton";
            this.LevelButtonList.margin = 0;
            this.LevelButtonList.multiSelect = false;
            this.LevelButtonList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.LevelButtonList.rowHeight = 0;
            this.LevelButtonList.scrollBar = "";
            this.LevelButtonList.treeButtonClassName = "";
            this.LevelButtonList.treeButtonGap = -1;
            this.LevelButtonList.treeCheckBoxClassName = "";
            this.LevelButtonList.treeList = false;
            this.LevelButtonList.visible = false;
            this.LevelButtonList.wrapping = "normal";
            try
            {
                this.LevelButtonList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButton1_GorwGuidePage_slot_0()
        {
            try
            {
                this.LevelButton1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButton1.autoRepeat = true;
            this.LevelButton1.autoSize = "none";
            this.LevelButton1.enabled = true;
            this.LevelButton1.groupName = "";
            this.LevelButton1.label = "";
            this.LevelButton1.overlayAlign = "none";
            this.LevelButton1.overlayImg = "";
            this.LevelButton1.overlayPadding = {x:0, y:0};
            this.LevelButton1.selected = false;
            this.LevelButton1.toggle = false;
            this.LevelButton1.usePrevLabel = false;
            this.LevelButton1.visible = true;
            try
            {
                this.LevelButton1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButton2_GorwGuidePage_slot_0()
        {
            try
            {
                this.LevelButton2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButton2.autoRepeat = false;
            this.LevelButton2.autoSize = "none";
            this.LevelButton2.enabled = true;
            this.LevelButton2.groupName = "";
            this.LevelButton2.label = "";
            this.LevelButton2.overlayAlign = "none";
            this.LevelButton2.overlayImg = "";
            this.LevelButton2.overlayPadding = {x:0, y:0};
            this.LevelButton2.selected = false;
            this.LevelButton2.toggle = false;
            this.LevelButton2.usePrevLabel = false;
            this.LevelButton2.visible = true;
            try
            {
                this.LevelButton2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButton3_GorwGuidePage_slot_0()
        {
            try
            {
                this.LevelButton3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButton3.autoRepeat = false;
            this.LevelButton3.autoSize = "none";
            this.LevelButton3.enabled = true;
            this.LevelButton3.groupName = "";
            this.LevelButton3.label = "";
            this.LevelButton3.overlayAlign = "none";
            this.LevelButton3.overlayImg = "";
            this.LevelButton3.overlayPadding = {x:0, y:0};
            this.LevelButton3.selected = false;
            this.LevelButton3.toggle = false;
            this.LevelButton3.usePrevLabel = false;
            this.LevelButton3.visible = true;
            try
            {
                this.LevelButton3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButton4_GorwGuidePage_slot_0()
        {
            try
            {
                this.LevelButton4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButton4.autoRepeat = false;
            this.LevelButton4.autoSize = "none";
            this.LevelButton4.enabled = true;
            this.LevelButton4.groupName = "";
            this.LevelButton4.label = "";
            this.LevelButton4.overlayAlign = "none";
            this.LevelButton4.overlayImg = "";
            this.LevelButton4.overlayPadding = {x:0, y:0};
            this.LevelButton4.selected = false;
            this.LevelButton4.toggle = false;
            this.LevelButton4.usePrevLabel = false;
            this.LevelButton4.visible = true;
            try
            {
                this.LevelButton4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButton5_GorwGuidePage_slot_0()
        {
            try
            {
                this.LevelButton5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButton5.autoRepeat = false;
            this.LevelButton5.autoSize = "none";
            this.LevelButton5.enabled = true;
            this.LevelButton5.groupName = "";
            this.LevelButton5.label = "";
            this.LevelButton5.overlayAlign = "none";
            this.LevelButton5.overlayImg = "";
            this.LevelButton5.overlayPadding = {x:0, y:0};
            this.LevelButton5.selected = false;
            this.LevelButton5.toggle = false;
            this.LevelButton5.usePrevLabel = false;
            this.LevelButton5.visible = true;
            try
            {
                this.LevelButton5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButton6_GorwGuidePage_slot_0()
        {
            try
            {
                this.LevelButton6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButton6.autoRepeat = false;
            this.LevelButton6.autoSize = "none";
            this.LevelButton6.enabled = true;
            this.LevelButton6.groupName = "";
            this.LevelButton6.label = "";
            this.LevelButton6.overlayAlign = "none";
            this.LevelButton6.overlayImg = "";
            this.LevelButton6.overlayPadding = {x:0, y:0};
            this.LevelButton6.selected = false;
            this.LevelButton6.toggle = false;
            this.LevelButton6.usePrevLabel = false;
            this.LevelButton6.visible = true;
            try
            {
                this.LevelButton6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButton7_GorwGuidePage_slot_0()
        {
            try
            {
                this.LevelButton7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButton7.autoRepeat = false;
            this.LevelButton7.autoSize = "none";
            this.LevelButton7.enabled = true;
            this.LevelButton7.groupName = "";
            this.LevelButton7.label = "";
            this.LevelButton7.overlayAlign = "none";
            this.LevelButton7.overlayImg = "";
            this.LevelButton7.overlayPadding = {x:0, y:0};
            this.LevelButton7.selected = false;
            this.LevelButton7.toggle = false;
            this.LevelButton7.usePrevLabel = false;
            this.LevelButton7.visible = true;
            try
            {
                this.LevelButton7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_LevelButton8_GorwGuidePage_slot_0()
        {
            try
            {
                this.LevelButton8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LevelButton8.autoRepeat = false;
            this.LevelButton8.autoSize = "none";
            this.LevelButton8.enabled = true;
            this.LevelButton8.groupName = "";
            this.LevelButton8.label = "";
            this.LevelButton8.overlayAlign = "none";
            this.LevelButton8.overlayImg = "";
            this.LevelButton8.overlayPadding = {x:0, y:0};
            this.LevelButton8.selected = false;
            this.LevelButton8.toggle = false;
            this.LevelButton8.usePrevLabel = false;
            this.LevelButton8.visible = true;
            try
            {
                this.LevelButton8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_GgMap1_GorwGuidePage_slot_0()
        {
            try
            {
                this.GgMap1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.GgMap1.autoRepeat = false;
            this.GgMap1.autoSize = "none";
            this.GgMap1.enabled = true;
            this.GgMap1.groupName = "";
            this.GgMap1.label = "";
            this.GgMap1.overlayAlign = "none";
            this.GgMap1.overlayImg = "";
            this.GgMap1.overlayPadding = {x:0, y:0};
            this.GgMap1.selected = false;
            this.GgMap1.toggle = false;
            this.GgMap1.usePrevLabel = false;
            this.GgMap1.visible = true;
            try
            {
                this.GgMap1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_GgMap3_GorwGuidePage_slot_0()
        {
            try
            {
                this.GgMap3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.GgMap3.autoRepeat = false;
            this.GgMap3.autoSize = "none";
            this.GgMap3.enabled = true;
            this.GgMap3.groupName = "";
            this.GgMap3.label = "";
            this.GgMap3.overlayAlign = "none";
            this.GgMap3.overlayImg = "";
            this.GgMap3.overlayPadding = {x:0, y:0};
            this.GgMap3.selected = false;
            this.GgMap3.toggle = false;
            this.GgMap3.usePrevLabel = false;
            this.GgMap3.visible = true;
            try
            {
                this.GgMap3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_GgMap2_GorwGuidePage_slot_0()
        {
            try
            {
                this.GgMap2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.GgMap2.autoRepeat = false;
            this.GgMap2.autoSize = "none";
            this.GgMap2.enabled = true;
            this.GgMap2.groupName = "";
            this.GgMap2.label = "";
            this.GgMap2.overlayAlign = "none";
            this.GgMap2.overlayImg = "";
            this.GgMap2.overlayPadding = {x:0, y:0};
            this.GgMap2.selected = false;
            this.GgMap2.toggle = false;
            this.GgMap2.usePrevLabel = false;
            this.GgMap2.visible = true;
            try
            {
                this.GgMap2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_GgMap4_GorwGuidePage_slot_0()
        {
            try
            {
                this.GgMap4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.GgMap4.autoRepeat = false;
            this.GgMap4.autoSize = "none";
            this.GgMap4.enabled = true;
            this.GgMap4.groupName = "";
            this.GgMap4.label = "";
            this.GgMap4.overlayAlign = "none";
            this.GgMap4.overlayImg = "";
            this.GgMap4.overlayPadding = {x:0, y:0};
            this.GgMap4.selected = false;
            this.GgMap4.toggle = false;
            this.GgMap4.usePrevLabel = false;
            this.GgMap4.visible = true;
            try
            {
                this.GgMap4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RecommendArrow_GorwGuidePage_recommendArrow_0()
        {
            try
            {
                this.RecommendArrow["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RecommendArrow.autoRepeat = false;
            this.RecommendArrow.autoSize = "none";
            this.RecommendArrow.enabled = true;
            this.RecommendArrow.groupName = "";
            this.RecommendArrow.label = "";
            this.RecommendArrow.overlayAlign = "none";
            this.RecommendArrow.overlayImg = "";
            this.RecommendArrow.overlayPadding = {x:0, y:0};
            this.RecommendArrow.selected = false;
            this.RecommendArrow.toggle = false;
            this.RecommendArrow.usePrevLabel = true;
            this.RecommendArrow.visible = false;
            try
            {
                this.RecommendArrow["componentInspectorSetting"] = false;
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
