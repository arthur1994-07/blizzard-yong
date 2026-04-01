package ActivityRecord_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class RecommendItem_57 extends MovieClip
    {
        public var MapItemDropListTitle:Label;
        public var ItemDropTitle:Label;
        public var EquipItemTitle:Label;
        public var HuntingItemTitle:Label;
        public var ItemDropTextScrollBar:ScrollBar;
        public var EquipItemScrollBar:ScrollBar;
        public var HuntingItemScrollBar:ScrollBar;
        public var HuntingItemList:TileList;
        public var EquipItemList:TileList;
        public var ItemDropTextList:ScrollingList;
        public var EquipItemSlot1:Slot;
        public var EquipItemSlot2:Slot;
        public var EquipItemSlot3:Slot;
        public var EquipItemSlot4:Slot;
        public var EquipItemSlot5:Slot;
        public var EquipItemSlot6:Slot;
        public var EquipItemSlot7:Slot;
        public var EquipItemSlot8:Slot;
        public var EquipItemSlot9:Slot;
        public var EquipItemSlot10:Slot;
        public var EquipItemSlot11:Slot;
        public var EquipItemSlot12:Slot;
        public var SloetSelectItem1:ListItemRenderer;
        public var SloetSelectItem2:ListItemRenderer;
        public var SloetSelectItem3:ListItemRenderer;
        public var SloetSelectItem4:ListItemRenderer;
        public var SloetSelectItem5:ListItemRenderer;
        public var SloetSelectItem6:ListItemRenderer;
        public var SloetSelectItem7:ListItemRenderer;
        public var SloetSelectItem8:ListItemRenderer;
        public var SloetSelectItem9:ListItemRenderer;
        public var SloetSelectItem10:ListItemRenderer;
        public var SloetSelectItem11:ListItemRenderer;
        public var SloetSelectItem12:ListItemRenderer;
        public var HuntingItemSlot1:Slot;
        public var HuntingItemSlot2:Slot;
        public var HuntingItemSlot3:Slot;
        public var HuntingItemSlot4:Slot;
        public var HuntingItemSlot5:Slot;
        public var HuntingItemSlot6:Slot;
        public var HuntingItemSlot7:Slot;
        public var HuntingSloetSelectItem1:ListItemRenderer;
        public var HuntingSloetSelectItem2:ListItemRenderer;
        public var HuntingSloetSelectItem3:ListItemRenderer;
        public var HuntingSloetSelectItem4:ListItemRenderer;
        public var HuntingSloetSelectItem5:ListItemRenderer;
        public var HuntingSloetSelectItem6:ListItemRenderer;
        public var HuntingSloetSelectItem7:ListItemRenderer;

        public function RecommendItem_57()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ItemDropTextScrollBar_RecommendItem_Layer1_0();
            this.__setProp_ItemDropTextList_RecommendItem_Layer1_0();
            this.__setProp_EquipItemScrollBar_RecommendItem_Layer1_0();
            this.__setProp_HuntingItemScrollBar_RecommendItem_Layer1_0();
            this.__setProp_EquipItemList_RecommendItem_List_0();
            this.__setProp_HuntingItemList_RecommendItem_List_0();
            this.__setProp_SloetSelectItem1_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem2_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem3_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem4_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem5_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem6_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem7_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem8_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem9_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem10_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem11_RecommendItem_SlotSelect_0();
            this.__setProp_SloetSelectItem12_RecommendItem_SlotSelect_0();
            this.__setProp_HuntingSloetSelectItem1_RecommendItem_SlotSelect_0();
            this.__setProp_HuntingSloetSelectItem2_RecommendItem_SlotSelect_0();
            this.__setProp_HuntingSloetSelectItem3_RecommendItem_SlotSelect_0();
            this.__setProp_HuntingSloetSelectItem4_RecommendItem_SlotSelect_0();
            this.__setProp_HuntingSloetSelectItem5_RecommendItem_SlotSelect_0();
            this.__setProp_HuntingSloetSelectItem6_RecommendItem_SlotSelect_0();
            this.__setProp_HuntingSloetSelectItem7_RecommendItem_SlotSelect_0();
            return;
        }// end function

        function __setProp_ItemDropTextScrollBar_RecommendItem_Layer1_0()
        {
            try
            {
                this.ItemDropTextScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ItemDropTextScrollBar.enabled = true;
            this.ItemDropTextScrollBar.minThumbSize = 10;
            this.ItemDropTextScrollBar.offsetBottom = 0;
            this.ItemDropTextScrollBar.offsetTop = 0;
            this.ItemDropTextScrollBar.scrollTarget = "MapInfoText";
            this.ItemDropTextScrollBar.trackMode = "scrollPage";
            this.ItemDropTextScrollBar.visible = true;
            try
            {
                this.ItemDropTextScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ItemDropTextList_RecommendItem_Layer1_0()
        {
            try
            {
                this.ItemDropTextList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ItemDropTextList.enabled = true;
            this.ItemDropTextList.focusable = true;
            this.ItemDropTextList.itemRendererName = "DefaultListItemRenderer";
            this.ItemDropTextList.itemRendererInstanceName = "";
            this.ItemDropTextList.margin = 0;
            this.ItemDropTextList.multiSelect = false;
            this.ItemDropTextList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.ItemDropTextList.rowHeight = 0;
            this.ItemDropTextList.scrollBar = "ItemDropTextScrollBar";
            this.ItemDropTextList.treeButtonClassName = "";
            this.ItemDropTextList.treeButtonGap = -1;
            this.ItemDropTextList.treeCheckBoxClassName = "";
            this.ItemDropTextList.treeList = false;
            this.ItemDropTextList.visible = true;
            this.ItemDropTextList.wrapping = "normal";
            try
            {
                this.ItemDropTextList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_EquipItemScrollBar_RecommendItem_Layer1_0()
        {
            try
            {
                this.EquipItemScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.EquipItemScrollBar.enabled = true;
            this.EquipItemScrollBar.minThumbSize = 10;
            this.EquipItemScrollBar.offsetBottom = 0;
            this.EquipItemScrollBar.offsetTop = 0;
            this.EquipItemScrollBar.scrollTarget = "EquipItemList";
            this.EquipItemScrollBar.trackMode = "scrollPage";
            this.EquipItemScrollBar.visible = true;
            try
            {
                this.EquipItemScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingItemScrollBar_RecommendItem_Layer1_0()
        {
            try
            {
                this.HuntingItemScrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingItemScrollBar.enabled = true;
            this.HuntingItemScrollBar.minThumbSize = 10;
            this.HuntingItemScrollBar.offsetBottom = 0;
            this.HuntingItemScrollBar.offsetTop = 0;
            this.HuntingItemScrollBar.scrollTarget = "HuntingItemList";
            this.HuntingItemScrollBar.trackMode = "scrollPage";
            this.HuntingItemScrollBar.visible = true;
            try
            {
                this.HuntingItemScrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_EquipItemList_RecommendItem_List_0()
        {
            try
            {
                this.EquipItemList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.EquipItemList.columnWidth = 12;
            this.EquipItemList.direction = "horizontal";
            this.EquipItemList.enabled = true;
            this.EquipItemList.externalColumnCount = 0;
            this.EquipItemList.focusable = true;
            this.EquipItemList.itemRendererName = "";
            this.EquipItemList.itemRendererInstanceName = "SloetSelectItem";
            this.EquipItemList.margin = 0;
            this.EquipItemList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.EquipItemList.rowHeight = 0;
            this.EquipItemList.scrollBar = "EquipItemScrollBar";
            this.EquipItemList.visible = true;
            this.EquipItemList.wrapping = "normal";
            try
            {
                this.EquipItemList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingItemList_RecommendItem_List_0()
        {
            try
            {
                this.HuntingItemList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingItemList.columnWidth = 7;
            this.HuntingItemList.direction = "horizontal";
            this.HuntingItemList.enabled = true;
            this.HuntingItemList.externalColumnCount = 0;
            this.HuntingItemList.focusable = true;
            this.HuntingItemList.itemRendererName = "";
            this.HuntingItemList.itemRendererInstanceName = "HuntingSloetSelectItem";
            this.HuntingItemList.margin = 0;
            this.HuntingItemList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.HuntingItemList.rowHeight = 0;
            this.HuntingItemList.scrollBar = "HuntingItemScrollBar";
            this.HuntingItemList.visible = true;
            this.HuntingItemList.wrapping = "normal";
            try
            {
                this.HuntingItemList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem1_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem1.autoRepeat = false;
            this.SloetSelectItem1.autoSize = "none";
            this.SloetSelectItem1.enabled = true;
            this.SloetSelectItem1.groupName = "";
            this.SloetSelectItem1.label = "";
            this.SloetSelectItem1.overlayAlign = "none";
            this.SloetSelectItem1.overlayImg = "";
            this.SloetSelectItem1.overlayPadding = {x:0, y:0};
            this.SloetSelectItem1.selected = false;
            this.SloetSelectItem1.toggle = false;
            this.SloetSelectItem1.usePrevLabel = true;
            this.SloetSelectItem1.visible = false;
            try
            {
                this.SloetSelectItem1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem2_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem2.autoRepeat = false;
            this.SloetSelectItem2.autoSize = "none";
            this.SloetSelectItem2.enabled = true;
            this.SloetSelectItem2.groupName = "";
            this.SloetSelectItem2.label = "";
            this.SloetSelectItem2.overlayAlign = "none";
            this.SloetSelectItem2.overlayImg = "";
            this.SloetSelectItem2.overlayPadding = {x:0, y:0};
            this.SloetSelectItem2.selected = false;
            this.SloetSelectItem2.toggle = false;
            this.SloetSelectItem2.usePrevLabel = true;
            this.SloetSelectItem2.visible = false;
            try
            {
                this.SloetSelectItem2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem3_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem3.autoRepeat = false;
            this.SloetSelectItem3.autoSize = "none";
            this.SloetSelectItem3.enabled = true;
            this.SloetSelectItem3.groupName = "";
            this.SloetSelectItem3.label = "";
            this.SloetSelectItem3.overlayAlign = "none";
            this.SloetSelectItem3.overlayImg = "";
            this.SloetSelectItem3.overlayPadding = {x:0, y:0};
            this.SloetSelectItem3.selected = false;
            this.SloetSelectItem3.toggle = false;
            this.SloetSelectItem3.usePrevLabel = true;
            this.SloetSelectItem3.visible = false;
            try
            {
                this.SloetSelectItem3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem4_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem4.autoRepeat = false;
            this.SloetSelectItem4.autoSize = "none";
            this.SloetSelectItem4.enabled = true;
            this.SloetSelectItem4.groupName = "";
            this.SloetSelectItem4.label = "";
            this.SloetSelectItem4.overlayAlign = "none";
            this.SloetSelectItem4.overlayImg = "";
            this.SloetSelectItem4.overlayPadding = {x:0, y:0};
            this.SloetSelectItem4.selected = false;
            this.SloetSelectItem4.toggle = false;
            this.SloetSelectItem4.usePrevLabel = true;
            this.SloetSelectItem4.visible = false;
            try
            {
                this.SloetSelectItem4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem5_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem5.autoRepeat = false;
            this.SloetSelectItem5.autoSize = "none";
            this.SloetSelectItem5.enabled = true;
            this.SloetSelectItem5.groupName = "";
            this.SloetSelectItem5.label = "";
            this.SloetSelectItem5.overlayAlign = "none";
            this.SloetSelectItem5.overlayImg = "";
            this.SloetSelectItem5.overlayPadding = {x:0, y:0};
            this.SloetSelectItem5.selected = false;
            this.SloetSelectItem5.toggle = false;
            this.SloetSelectItem5.usePrevLabel = true;
            this.SloetSelectItem5.visible = false;
            try
            {
                this.SloetSelectItem5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem6_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem6.autoRepeat = false;
            this.SloetSelectItem6.autoSize = "none";
            this.SloetSelectItem6.enabled = true;
            this.SloetSelectItem6.groupName = "";
            this.SloetSelectItem6.label = "";
            this.SloetSelectItem6.overlayAlign = "none";
            this.SloetSelectItem6.overlayImg = "";
            this.SloetSelectItem6.overlayPadding = {x:0, y:0};
            this.SloetSelectItem6.selected = false;
            this.SloetSelectItem6.toggle = false;
            this.SloetSelectItem6.usePrevLabel = true;
            this.SloetSelectItem6.visible = false;
            try
            {
                this.SloetSelectItem6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem7_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem7.autoRepeat = false;
            this.SloetSelectItem7.autoSize = "none";
            this.SloetSelectItem7.enabled = true;
            this.SloetSelectItem7.groupName = "";
            this.SloetSelectItem7.label = "";
            this.SloetSelectItem7.overlayAlign = "none";
            this.SloetSelectItem7.overlayImg = "";
            this.SloetSelectItem7.overlayPadding = {x:0, y:0};
            this.SloetSelectItem7.selected = false;
            this.SloetSelectItem7.toggle = false;
            this.SloetSelectItem7.usePrevLabel = true;
            this.SloetSelectItem7.visible = false;
            try
            {
                this.SloetSelectItem7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem8_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem8.autoRepeat = false;
            this.SloetSelectItem8.autoSize = "none";
            this.SloetSelectItem8.enabled = true;
            this.SloetSelectItem8.groupName = "";
            this.SloetSelectItem8.label = "";
            this.SloetSelectItem8.overlayAlign = "none";
            this.SloetSelectItem8.overlayImg = "";
            this.SloetSelectItem8.overlayPadding = {x:0, y:0};
            this.SloetSelectItem8.selected = false;
            this.SloetSelectItem8.toggle = false;
            this.SloetSelectItem8.usePrevLabel = true;
            this.SloetSelectItem8.visible = false;
            try
            {
                this.SloetSelectItem8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem9_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem9.autoRepeat = false;
            this.SloetSelectItem9.autoSize = "none";
            this.SloetSelectItem9.enabled = true;
            this.SloetSelectItem9.groupName = "";
            this.SloetSelectItem9.label = "";
            this.SloetSelectItem9.overlayAlign = "none";
            this.SloetSelectItem9.overlayImg = "";
            this.SloetSelectItem9.overlayPadding = {x:0, y:0};
            this.SloetSelectItem9.selected = false;
            this.SloetSelectItem9.toggle = false;
            this.SloetSelectItem9.usePrevLabel = true;
            this.SloetSelectItem9.visible = false;
            try
            {
                this.SloetSelectItem9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem10_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem10.autoRepeat = false;
            this.SloetSelectItem10.autoSize = "none";
            this.SloetSelectItem10.enabled = true;
            this.SloetSelectItem10.groupName = "";
            this.SloetSelectItem10.label = "";
            this.SloetSelectItem10.overlayAlign = "none";
            this.SloetSelectItem10.overlayImg = "";
            this.SloetSelectItem10.overlayPadding = {x:0, y:0};
            this.SloetSelectItem10.selected = false;
            this.SloetSelectItem10.toggle = false;
            this.SloetSelectItem10.usePrevLabel = true;
            this.SloetSelectItem10.visible = false;
            try
            {
                this.SloetSelectItem10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem11_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem11.autoRepeat = false;
            this.SloetSelectItem11.autoSize = "none";
            this.SloetSelectItem11.enabled = true;
            this.SloetSelectItem11.groupName = "";
            this.SloetSelectItem11.label = "";
            this.SloetSelectItem11.overlayAlign = "none";
            this.SloetSelectItem11.overlayImg = "";
            this.SloetSelectItem11.overlayPadding = {x:0, y:0};
            this.SloetSelectItem11.selected = false;
            this.SloetSelectItem11.toggle = false;
            this.SloetSelectItem11.usePrevLabel = true;
            this.SloetSelectItem11.visible = false;
            try
            {
                this.SloetSelectItem11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SloetSelectItem12_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.SloetSelectItem12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SloetSelectItem12.autoRepeat = false;
            this.SloetSelectItem12.autoSize = "none";
            this.SloetSelectItem12.enabled = true;
            this.SloetSelectItem12.groupName = "";
            this.SloetSelectItem12.label = "";
            this.SloetSelectItem12.overlayAlign = "none";
            this.SloetSelectItem12.overlayImg = "";
            this.SloetSelectItem12.overlayPadding = {x:0, y:0};
            this.SloetSelectItem12.selected = false;
            this.SloetSelectItem12.toggle = false;
            this.SloetSelectItem12.usePrevLabel = true;
            this.SloetSelectItem12.visible = false;
            try
            {
                this.SloetSelectItem12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingSloetSelectItem1_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.HuntingSloetSelectItem1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingSloetSelectItem1.autoRepeat = false;
            this.HuntingSloetSelectItem1.autoSize = "none";
            this.HuntingSloetSelectItem1.enabled = true;
            this.HuntingSloetSelectItem1.groupName = "";
            this.HuntingSloetSelectItem1.label = "";
            this.HuntingSloetSelectItem1.overlayAlign = "none";
            this.HuntingSloetSelectItem1.overlayImg = "";
            this.HuntingSloetSelectItem1.overlayPadding = {x:0, y:0};
            this.HuntingSloetSelectItem1.selected = false;
            this.HuntingSloetSelectItem1.toggle = false;
            this.HuntingSloetSelectItem1.usePrevLabel = true;
            this.HuntingSloetSelectItem1.visible = false;
            try
            {
                this.HuntingSloetSelectItem1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingSloetSelectItem2_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.HuntingSloetSelectItem2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingSloetSelectItem2.autoRepeat = false;
            this.HuntingSloetSelectItem2.autoSize = "none";
            this.HuntingSloetSelectItem2.enabled = true;
            this.HuntingSloetSelectItem2.groupName = "";
            this.HuntingSloetSelectItem2.label = "";
            this.HuntingSloetSelectItem2.overlayAlign = "none";
            this.HuntingSloetSelectItem2.overlayImg = "";
            this.HuntingSloetSelectItem2.overlayPadding = {x:0, y:0};
            this.HuntingSloetSelectItem2.selected = false;
            this.HuntingSloetSelectItem2.toggle = false;
            this.HuntingSloetSelectItem2.usePrevLabel = true;
            this.HuntingSloetSelectItem2.visible = false;
            try
            {
                this.HuntingSloetSelectItem2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingSloetSelectItem3_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.HuntingSloetSelectItem3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingSloetSelectItem3.autoRepeat = false;
            this.HuntingSloetSelectItem3.autoSize = "none";
            this.HuntingSloetSelectItem3.enabled = true;
            this.HuntingSloetSelectItem3.groupName = "";
            this.HuntingSloetSelectItem3.label = "";
            this.HuntingSloetSelectItem3.overlayAlign = "none";
            this.HuntingSloetSelectItem3.overlayImg = "";
            this.HuntingSloetSelectItem3.overlayPadding = {x:0, y:0};
            this.HuntingSloetSelectItem3.selected = false;
            this.HuntingSloetSelectItem3.toggle = false;
            this.HuntingSloetSelectItem3.usePrevLabel = true;
            this.HuntingSloetSelectItem3.visible = false;
            try
            {
                this.HuntingSloetSelectItem3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingSloetSelectItem4_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.HuntingSloetSelectItem4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingSloetSelectItem4.autoRepeat = false;
            this.HuntingSloetSelectItem4.autoSize = "none";
            this.HuntingSloetSelectItem4.enabled = true;
            this.HuntingSloetSelectItem4.groupName = "";
            this.HuntingSloetSelectItem4.label = "";
            this.HuntingSloetSelectItem4.overlayAlign = "none";
            this.HuntingSloetSelectItem4.overlayImg = "";
            this.HuntingSloetSelectItem4.overlayPadding = {x:0, y:0};
            this.HuntingSloetSelectItem4.selected = false;
            this.HuntingSloetSelectItem4.toggle = false;
            this.HuntingSloetSelectItem4.usePrevLabel = true;
            this.HuntingSloetSelectItem4.visible = false;
            try
            {
                this.HuntingSloetSelectItem4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingSloetSelectItem5_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.HuntingSloetSelectItem5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingSloetSelectItem5.autoRepeat = false;
            this.HuntingSloetSelectItem5.autoSize = "none";
            this.HuntingSloetSelectItem5.enabled = true;
            this.HuntingSloetSelectItem5.groupName = "";
            this.HuntingSloetSelectItem5.label = "";
            this.HuntingSloetSelectItem5.overlayAlign = "none";
            this.HuntingSloetSelectItem5.overlayImg = "";
            this.HuntingSloetSelectItem5.overlayPadding = {x:0, y:0};
            this.HuntingSloetSelectItem5.selected = false;
            this.HuntingSloetSelectItem5.toggle = false;
            this.HuntingSloetSelectItem5.usePrevLabel = true;
            this.HuntingSloetSelectItem5.visible = false;
            try
            {
                this.HuntingSloetSelectItem5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingSloetSelectItem6_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.HuntingSloetSelectItem6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingSloetSelectItem6.autoRepeat = false;
            this.HuntingSloetSelectItem6.autoSize = "none";
            this.HuntingSloetSelectItem6.enabled = true;
            this.HuntingSloetSelectItem6.groupName = "";
            this.HuntingSloetSelectItem6.label = "";
            this.HuntingSloetSelectItem6.overlayAlign = "none";
            this.HuntingSloetSelectItem6.overlayImg = "";
            this.HuntingSloetSelectItem6.overlayPadding = {x:0, y:0};
            this.HuntingSloetSelectItem6.selected = false;
            this.HuntingSloetSelectItem6.toggle = false;
            this.HuntingSloetSelectItem6.usePrevLabel = true;
            this.HuntingSloetSelectItem6.visible = false;
            try
            {
                this.HuntingSloetSelectItem6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HuntingSloetSelectItem7_RecommendItem_SlotSelect_0()
        {
            try
            {
                this.HuntingSloetSelectItem7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HuntingSloetSelectItem7.autoRepeat = false;
            this.HuntingSloetSelectItem7.autoSize = "none";
            this.HuntingSloetSelectItem7.enabled = true;
            this.HuntingSloetSelectItem7.groupName = "";
            this.HuntingSloetSelectItem7.label = "";
            this.HuntingSloetSelectItem7.overlayAlign = "none";
            this.HuntingSloetSelectItem7.overlayImg = "";
            this.HuntingSloetSelectItem7.overlayPadding = {x:0, y:0};
            this.HuntingSloetSelectItem7.selected = false;
            this.HuntingSloetSelectItem7.toggle = false;
            this.HuntingSloetSelectItem7.usePrevLabel = true;
            this.HuntingSloetSelectItem7.visible = false;
            try
            {
                this.HuntingSloetSelectItem7["componentInspectorSetting"] = false;
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
