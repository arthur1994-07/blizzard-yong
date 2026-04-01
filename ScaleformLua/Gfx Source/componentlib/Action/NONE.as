package 
{
    import flash.display.*;
    import scaleform.clik.data.*;

    dynamic public class NONE extends MovieClip
    {
        public var __id11_:DefaultButton_small;
        public var __id26_:DefaultRadioButton_NoText;
        public var __id37_:DefaultRadioButton;
        public var __id62_:DefaultButton_h48;
        public var colorPicker:DefaultColorPicker;
        public var __id34_:Custom_Label_1;
        public var __id24_:DefaultCheckBox_NoText;
        public var __id35_:Help_TextArea;
        public var __id53_:ToggleButton_MinMax;
        public var __id43_:ToggleButton_Lock;
        public var scrollBar:DefaultScrollBar;
        public var __id2_:ToggleButton;
        public var __id40_:MarketButton;
        public var __id3_:DefaultLabel;
        public var __id56_:MaximizeButton;
        public var __id74_:DefaultButton_Sns1;
        public var __id75_:DefaultButton_Sns2;
        public var iconPoint:iconPointComponent;
        public var __id28_:DropdownMenu_NoButton;
        public var slot1:DefaultSlot;
        public var tileList:DefaultTileList;
        public var __id6_:DefaultSlider;
        public var __id55_:MinimizeButton;
        public var iconMoney:iconMoneyComponent;
        public var optionStepper2:PageOptionStepper;
        public var optionStepper:DefaultOptionStepper;
        public var __id7_:DefaultStatusIndicator;
        public var __id19_:TabButton_lower;
        public var buttonBar:DefaultButtonBar;
        public var __id4_:DefaultTextArea;
        public var tree:DefaultScrollingList;
        public var __id32_:SortButton;
        public var dropdown:DefaultDropdownMenu;
        public var __id33_:TextButton;
        public var __id48_:DefaultButton;
        public var scrollingList:DefaultScrollingList;
        public var __id12_:ToggleButton_small;
        public var __id30_:DefaultButton_swap;
        public var __id49_:Label_Multiline;
        public var scrollIndicator:DefaultScrollIndicator;
        public var __id8_:DefaultNumericStepper;
        public var __id20_:TreeButton;
        public var exTileList:MovieClip;
        public var __id9_:DefaultButton;
        public var __id10_:TabButton;
        public var __id36_:DefaultCheckBox;
        public var TbtnName:TextSortButton;
        public var treeData:Array;

        public function NONE()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_buttonBar_Scene1_components_0();
            this.__setProp_dropdown_Scene1_components_0();
            this.__setProp_tileList_Scene1_components_0();
            this.__setProp___id2__Scene1_components_0();
            this.__setProp___id3__Scene1_components_0();
            this.__setProp___id4__Scene1_components_0();
            this.__setProp___id6__Scene1_components_0();
            this.__setProp___id7__Scene1_components_0();
            this.__setProp___id8__Scene1_components_0();
            this.__setProp_optionStepper_Scene1_components_0();
            this.__setProp_scrollingList_Scene1_components_0();
            this.__setProp_optionStepper2_Scene1_components_0();
            this.__setProp___id9__Scene1_components_0();
            this.__setProp___id10__Scene1_components_0();
            this.__setProp___id11__Scene1_components_0();
            this.__setProp___id12__Scene1_components_0();
            this.__setProp___id19__Scene1_components_0();
            this.__setProp___id20__Scene1_components_0();
            this.__setProp_tree_Scene1_components_0();
            this.__setProp_TbtnName_Scene1_components_0();
            this.__setProp___id24__Scene1_components_0();
            this.__setProp___id26__Scene1_components_0();
            this.__setProp___id28__Scene1_components_0();
            this.__setProp___id30__Scene1_components_0();
            this.__setProp___id32__Scene1_components_0();
            this.__setProp___id33__Scene1_components_0();
            this.__setProp___id34__Scene1_components_0();
            this.__setProp___id35__Scene1_components_0();
            this.__setProp___id36__Scene1_components_0();
            this.__setProp___id37__Scene1_components_0();
            this.__setProp___id40__Scene1_components_0();
            this.__setProp___id43__Scene1_components_0();
            this.__setProp___id48__Scene1_components_0();
            this.__setProp___id49__Scene1_components_0();
            this.__setProp___id53__Scene1_components_0();
            this.__setProp___id55__Scene1_components_0();
            this.__setProp___id56__Scene1_components_0();
            this.__setProp___id62__Scene1_components_0();
            this.__setProp___id74__Scene1_components_0();
            this.__setProp___id75__Scene1_components_0();
            return;
        }// end function

        function __setProp_buttonBar_Scene1_components_0()
        {
            try
            {
                this.buttonBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.buttonBar.autoSize = "none";
            this.buttonBar.buttonWidth = 0;
            this.buttonBar.direction = "horizontal";
            this.buttonBar.enabled = true;
            this.buttonBar.focusable = false;
            this.buttonBar.itemRendererName = "TabButton";
            this.buttonBar.preventAutoSize = true;
            this.buttonBar.spacing = 2;
            this.buttonBar.visible = true;
            try
            {
                this.buttonBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dropdown_Scene1_components_0()
        {
            try
            {
                this.dropdown["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.dropdown.autoSize = "none";
            this.dropdown.dropdown = "DefaultScrollingList";
            this.dropdown.enabled = true;
            this.dropdown.focusable = false;
            this.dropdown.groupName = "";
            this.dropdown.itemRenderer = "DefaultListItemRenderer";
            this.dropdown.menuDirection = "down";
            this.dropdown.menuMargin = 1;
            this.dropdown.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.dropdown.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.dropdown.menuRowCount = 5;
            this.dropdown.menuRowsFixed = false;
            this.dropdown.menuWidth = -1;
            this.dropdown.menuWrapping = "normal";
            this.dropdown.overlayAlign = "none";
            this.dropdown.overlayImg = "";
            this.dropdown.overlayPadding = {x:0, y:0};
            this.dropdown.preventAutoSize = true;
            this.dropdown.scrollBar = "";
            this.dropdown.inspectableThumbOffset = {top:0, bottom:0};
            this.dropdown.visible = true;
            try
            {
                this.dropdown["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tileList_Scene1_components_0()
        {
            try
            {
                this.tileList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tileList.columnWidth = 80;
            this.tileList.direction = "horizontal";
            this.tileList.enabled = true;
            this.tileList.externalColumnCount = 0;
            this.tileList.focusable = false;
            this.tileList.itemRendererName = "DefaultListItemRenderer";
            this.tileList.itemRendererInstanceName = "";
            this.tileList.margin = 1;
            this.tileList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.tileList.rowHeight = 0;
            this.tileList.scrollBar = "";
            this.tileList.visible = true;
            this.tileList.wrapping = "none";
            try
            {
                this.tileList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id2__Scene1_components_0()
        {
            try
            {
                this.__id2_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id2_.autoRepeat = false;
            this.__id2_.autoSize = "none";
            this.__id2_.enabled = true;
            this.__id2_.focusable = false;
            this.__id2_.groupName = "";
            this.__id2_.label = "ToggleButton";
            this.__id2_.overlayAlign = "none";
            this.__id2_.overlayImg = "";
            this.__id2_.overlayPadding = {x:0, y:0};
            this.__id2_.selected = false;
            this.__id2_.toggle = true;
            this.__id2_.visible = true;
            try
            {
                this.__id2_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id3__Scene1_components_0()
        {
            try
            {
                this.__id3_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id3_.autoSize = "none";
            this.__id3_.autoSizeEnable = false;
            this.__id3_.enabled = true;
            this.__id3_.text = "Label";
            this.__id3_.visible = true;
            try
            {
                this.__id3_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id4__Scene1_components_0()
        {
            try
            {
                this.__id4_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id4_.defaultText = "";
            this.__id4_.displayAsPassword = false;
            this.__id4_.editable = false;
            this.__id4_.enabled = true;
            this.__id4_.focusable = false;
            this.__id4_.maxByte = 0;
            this.__id4_.maxChars = 0;
            this.__id4_.minThumbSize = 1;
            this.__id4_.OnlyNumber = false;
            this.__id4_.Restrict = "all";
            this.__id4_.RestrictAddOn = "";
            this.__id4_.scrollBar = "";
            this.__id4_.text = "";
            this.__id4_.textAlign = "left";
            this.__id4_.thumbOffset = {top:0, bottom:0};
            this.__id4_.visible = true;
            try
            {
                this.__id4_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id6__Scene1_components_0()
        {
            try
            {
                this.__id6_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id6_.enabled = true;
            this.__id6_.focusable = false;
            this.__id6_.liveDragging = true;
            this.__id6_.maximum = 10;
            this.__id6_.minimum = 0;
            this.__id6_.offsetLeft = 0;
            this.__id6_.offsetRight = 0;
            this.__id6_.snapInterval = 1;
            this.__id6_.snapping = false;
            this.__id6_.value = 0;
            this.__id6_.visible = true;
            try
            {
                this.__id6_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id7__Scene1_components_0()
        {
            try
            {
                this.__id7_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id7_.enabled = true;
            this.__id7_.maximum = 10;
            this.__id7_.minimum = 0;
            this.__id7_.value = 5;
            this.__id7_.visible = true;
            try
            {
                this.__id7_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id8__Scene1_components_0()
        {
            try
            {
                this.__id8_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id8_.enabled = true;
            this.__id8_.focusable = false;
            this.__id8_.maximum = 10;
            this.__id8_.minimum = 0;
            this.__id8_.stepSize = 1;
            this.__id8_.value = 0;
            this.__id8_.visible = true;
            try
            {
                this.__id8_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_optionStepper_Scene1_components_0()
        {
            try
            {
                this.optionStepper["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.optionStepper.enabled = true;
            this.optionStepper.focusable = false;
            this.optionStepper.visible = true;
            try
            {
                this.optionStepper["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollingList_Scene1_components_0()
        {
            try
            {
                this.scrollingList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollingList.enabled = true;
            this.scrollingList.focusable = false;
            this.scrollingList.itemRendererName = "ListItemRenderer_h18";
            this.scrollingList.itemRendererInstanceName = "";
            this.scrollingList.margin = 0;
            this.scrollingList.multiSelect = false;
            this.scrollingList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.scrollingList.rowHeight = 0;
            this.scrollingList.scrollBar = "DefaultScrollBar";
            this.scrollingList.treeButtonClassName = "";
            this.scrollingList.treeButtonGap = -1;
            this.scrollingList.treeCheckBoxClassName = "";
            this.scrollingList.treeList = false;
            this.scrollingList.visible = true;
            this.scrollingList.wrapping = "normal";
            try
            {
                this.scrollingList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_optionStepper2_Scene1_components_0()
        {
            try
            {
                this.optionStepper2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.optionStepper2.enabled = true;
            this.optionStepper2.focusable = false;
            this.optionStepper2.visible = true;
            try
            {
                this.optionStepper2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id9__Scene1_components_0()
        {
            try
            {
                this.__id9_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id9_.autoRepeat = false;
            this.__id9_.autoSize = "none";
            this.__id9_.enabled = true;
            this.__id9_.focusable = false;
            this.__id9_.groupName = "";
            this.__id9_.label = "DefautlButton";
            this.__id9_.overlayAlign = "none";
            this.__id9_.overlayImg = "";
            this.__id9_.overlayPadding = {x:0, y:0};
            this.__id9_.selected = false;
            this.__id9_.toggle = false;
            this.__id9_.visible = true;
            try
            {
                this.__id9_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id10__Scene1_components_0()
        {
            try
            {
                this.__id10_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id10_.autoRepeat = false;
            this.__id10_.autoSize = "none";
            this.__id10_.enabled = true;
            this.__id10_.focusable = false;
            this.__id10_.groupName = "";
            this.__id10_.label = "TabButton";
            this.__id10_.overlayAlign = "none";
            this.__id10_.overlayImg = "";
            this.__id10_.overlayPadding = {x:0, y:0};
            this.__id10_.selected = false;
            this.__id10_.toggle = true;
            this.__id10_.visible = true;
            try
            {
                this.__id10_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id11__Scene1_components_0()
        {
            try
            {
                this.__id11_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id11_.autoRepeat = false;
            this.__id11_.autoSize = "none";
            this.__id11_.enabled = true;
            this.__id11_.focusable = false;
            this.__id11_.groupName = "";
            this.__id11_.label = "+";
            this.__id11_.overlayAlign = "none";
            this.__id11_.overlayImg = "";
            this.__id11_.overlayPadding = {x:0, y:0};
            this.__id11_.selected = false;
            this.__id11_.toggle = false;
            this.__id11_.visible = true;
            try
            {
                this.__id11_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id12__Scene1_components_0()
        {
            try
            {
                this.__id12_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id12_.autoRepeat = false;
            this.__id12_.autoSize = "none";
            this.__id12_.enabled = true;
            this.__id12_.focusable = false;
            this.__id12_.groupName = "";
            this.__id12_.label = "";
            this.__id12_.overlayAlign = "none";
            this.__id12_.overlayImg = "";
            this.__id12_.overlayPadding = {x:0, y:0};
            this.__id12_.selected = false;
            this.__id12_.toggle = true;
            this.__id12_.visible = true;
            try
            {
                this.__id12_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id19__Scene1_components_0()
        {
            try
            {
                this.__id19_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id19_.autoRepeat = false;
            this.__id19_.autoSize = "none";
            this.__id19_.enabled = true;
            this.__id19_.focusable = false;
            this.__id19_.groupName = "";
            this.__id19_.label = "TabButton_Lower";
            this.__id19_.overlayAlign = "none";
            this.__id19_.overlayImg = "";
            this.__id19_.overlayPadding = {x:0, y:0};
            this.__id19_.selected = false;
            this.__id19_.toggle = true;
            this.__id19_.visible = true;
            try
            {
                this.__id19_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id20__Scene1_components_0()
        {
            try
            {
                this.__id20_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id20_.autoRepeat = false;
            this.__id20_.autoSize = "none";
            this.__id20_.enabled = true;
            this.__id20_.everyFrameUpdate = false;
            this.__id20_.focusable = false;
            this.__id20_.label = "";
            this.__id20_.preventAutoSize = true;
            this.__id20_.selected = false;
            this.__id20_.toggle = false;
            this.__id20_.visible = true;
            try
            {
                this.__id20_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tree_Scene1_components_0()
        {
            try
            {
                this.tree["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tree.enabled = true;
            this.tree.focusable = true;
            this.tree.itemRendererName = "TreeItemRenderer";
            this.tree.itemRendererInstanceName = "";
            this.tree.margin = 0;
            this.tree.multiSelect = false;
            this.tree.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.tree.rowHeight = 0;
            this.tree.scrollBar = "DefaultScrollBar";
            this.tree.treeButtonClassName = "TreeButton";
            this.tree.treeButtonGap = -1;
            this.tree.treeCheckBoxClassName = "TreeCheckBox";
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

        function __setProp_TbtnName_Scene1_components_0()
        {
            try
            {
                this.TbtnName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TbtnName.autoRepeat = false;
            this.TbtnName.autoSize = "none";
            this.TbtnName.enabled = true;
            this.TbtnName.focusable = false;
            this.TbtnName.groupName = "";
            this.TbtnName.label = "오름/내림차 버튼 ";
            this.TbtnName.overlayAlign = "none";
            this.TbtnName.overlayImg = "";
            this.TbtnName.overlayPadding = {x:0, y:0};
            this.TbtnName.selected = false;
            this.TbtnName.toggle = true;
            this.TbtnName.visible = true;
            try
            {
                this.TbtnName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id24__Scene1_components_0()
        {
            try
            {
                this.__id24_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id24_.autoSize = "none";
            this.__id24_.enabled = true;
            this.__id24_.focusable = false;
            this.__id24_.groupName = "";
            this.__id24_.label = "";
            this.__id24_.overlayAlign = "none";
            this.__id24_.overlayImg = "";
            this.__id24_.overlayPadding = {x:0, y:0};
            this.__id24_.preventAutoSize = false;
            this.__id24_.selected = false;
            this.__id24_.visible = true;
            try
            {
                this.__id24_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id26__Scene1_components_0()
        {
            try
            {
                this.__id26_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id26_.autoSize = "none";
            this.__id26_.enabled = true;
            this.__id26_.focusable = false;
            this.__id26_.groupName = "";
            this.__id26_.label = "";
            this.__id26_.overlayAlign = "none";
            this.__id26_.overlayImg = "";
            this.__id26_.overlayPadding = {x:0, y:0};
            this.__id26_.preventAutoSize = false;
            this.__id26_.selected = false;
            this.__id26_.visible = true;
            try
            {
                this.__id26_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id28__Scene1_components_0()
        {
            try
            {
                this.__id28_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id28_.autoSize = "none";
            this.__id28_.dropdown = "DefaultScrollingList";
            this.__id28_.enabled = true;
            this.__id28_.focusable = false;
            this.__id28_.groupName = "";
            this.__id28_.itemRenderer = "DefaultListItemRenderer";
            this.__id28_.menuDirection = "down";
            this.__id28_.menuMargin = 1;
            this.__id28_.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.__id28_.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.__id28_.menuRowCount = 5;
            this.__id28_.menuRowsFixed = false;
            this.__id28_.menuWidth = -1;
            this.__id28_.menuWrapping = "normal";
            this.__id28_.overlayAlign = "none";
            this.__id28_.overlayImg = "";
            this.__id28_.overlayPadding = {x:0, y:0};
            this.__id28_.preventAutoSize = false;
            this.__id28_.scrollBar = "";
            this.__id28_.inspectableThumbOffset = {top:0, bottom:0};
            this.__id28_.visible = true;
            try
            {
                this.__id28_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id30__Scene1_components_0()
        {
            try
            {
                this.__id30_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id30_.autoRepeat = false;
            this.__id30_.autoSize = "none";
            this.__id30_.enabled = true;
            this.__id30_.focusable = false;
            this.__id30_.groupName = "";
            this.__id30_.label = "";
            this.__id30_.overlayAlign = "none";
            this.__id30_.overlayImg = "";
            this.__id30_.overlayPadding = {x:0, y:0};
            this.__id30_.selected = false;
            this.__id30_.toggle = false;
            this.__id30_.visible = true;
            try
            {
                this.__id30_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id32__Scene1_components_0()
        {
            try
            {
                this.__id32_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id32_.autoRepeat = false;
            this.__id32_.autoSize = "none";
            this.__id32_.enabled = true;
            this.__id32_.focusable = false;
            this.__id32_.groupName = "";
            this.__id32_.label = "";
            this.__id32_.overlayAlign = "none";
            this.__id32_.overlayImg = "";
            this.__id32_.overlayPadding = {x:0, y:0};
            this.__id32_.selected = false;
            this.__id32_.toggle = true;
            this.__id32_.visible = true;
            try
            {
                this.__id32_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id33__Scene1_components_0()
        {
            try
            {
                this.__id33_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id33_.autoRepeat = false;
            this.__id33_.autoSize = "left";
            this.__id33_.enabled = true;
            this.__id33_.focusable = false;
            this.__id33_.groupName = "";
            this.__id33_.label = "text";
            this.__id33_.overlayAlign = "none";
            this.__id33_.overlayImg = "";
            this.__id33_.overlayPadding = {x:0, y:0};
            this.__id33_.selected = false;
            this.__id33_.toggle = false;
            this.__id33_.visible = true;
            try
            {
                this.__id33_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id34__Scene1_components_0()
        {
            try
            {
                this.__id34_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id34_.autoSize = "left";
            this.__id34_.autoSizeEnable = false;
            this.__id34_.enabled = true;
            this.__id34_.text = "Label";
            this.__id34_.visible = true;
            try
            {
                this.__id34_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id35__Scene1_components_0()
        {
            try
            {
                this.__id35_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id35_.defaultText = "";
            this.__id35_.displayAsPassword = false;
            this.__id35_.editable = true;
            this.__id35_.enabled = true;
            this.__id35_.focusable = true;
            this.__id35_.maxByte = 0;
            this.__id35_.maxChars = 0;
            this.__id35_.minThumbSize = 1;
            this.__id35_.OnlyNumber = false;
            this.__id35_.Restrict = "all";
            this.__id35_.RestrictAddOn = "";
            this.__id35_.scrollBar = "";
            this.__id35_.text = "Help_TextArea";
            this.__id35_.textAlign = "left";
            this.__id35_.thumbOffset = {top:0, bottom:0};
            this.__id35_.visible = true;
            try
            {
                this.__id35_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id36__Scene1_components_0()
        {
            try
            {
                this.__id36_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id36_.autoSize = "left";
            this.__id36_.enabled = true;
            this.__id36_.focusable = false;
            this.__id36_.groupName = "";
            this.__id36_.label = "Check Box";
            this.__id36_.overlayAlign = "none";
            this.__id36_.overlayImg = "";
            this.__id36_.overlayPadding = {x:0, y:0};
            this.__id36_.preventAutoSize = false;
            this.__id36_.selected = false;
            this.__id36_.visible = true;
            try
            {
                this.__id36_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id37__Scene1_components_0()
        {
            try
            {
                this.__id37_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id37_.autoSize = "left";
            this.__id37_.enabled = true;
            this.__id37_.focusable = false;
            this.__id37_.groupName = "";
            this.__id37_.label = "Radio Button";
            this.__id37_.overlayAlign = "none";
            this.__id37_.overlayImg = "";
            this.__id37_.overlayPadding = {x:0, y:0};
            this.__id37_.preventAutoSize = false;
            this.__id37_.selected = false;
            this.__id37_.visible = true;
            try
            {
                this.__id37_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id40__Scene1_components_0()
        {
            try
            {
                this.__id40_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id40_.autoRepeat = false;
            this.__id40_.autoSize = "none";
            this.__id40_.enabled = true;
            this.__id40_.focusable = false;
            this.__id40_.groupName = "";
            this.__id40_.label = "";
            this.__id40_.overlayAlign = "none";
            this.__id40_.overlayImg = "";
            this.__id40_.overlayPadding = {x:0, y:0};
            this.__id40_.selected = false;
            this.__id40_.toggle = false;
            this.__id40_.visible = true;
            try
            {
                this.__id40_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id43__Scene1_components_0()
        {
            try
            {
                this.__id43_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id43_.autoRepeat = false;
            this.__id43_.autoSize = "none";
            this.__id43_.enabled = true;
            this.__id43_.focusable = false;
            this.__id43_.groupName = "";
            this.__id43_.label = "";
            this.__id43_.overlayAlign = "none";
            this.__id43_.overlayImg = "";
            this.__id43_.overlayPadding = {x:0, y:0};
            this.__id43_.selected = false;
            this.__id43_.toggle = true;
            this.__id43_.visible = true;
            try
            {
                this.__id43_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id48__Scene1_components_0()
        {
            try
            {
                this.__id48_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id48_.autoRepeat = false;
            this.__id48_.autoSize = "none";
            this.__id48_.enabled = true;
            this.__id48_.focusable = false;
            this.__id48_.groupName = "";
            this.__id48_.label = "";
            this.__id48_.overlayAlign = "none";
            this.__id48_.overlayImg = "";
            this.__id48_.overlayPadding = {x:0, y:0};
            this.__id48_.selected = false;
            this.__id48_.toggle = false;
            this.__id48_.visible = true;
            try
            {
                this.__id48_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id49__Scene1_components_0()
        {
            try
            {
                this.__id49_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id49_.autoSize = "none";
            this.__id49_.autoSizeEnable = false;
            this.__id49_.enabled = true;
            this.__id49_.text = "MultiLine Label";
            this.__id49_.visible = true;
            try
            {
                this.__id49_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id53__Scene1_components_0()
        {
            try
            {
                this.__id53_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id53_.autoRepeat = false;
            this.__id53_.autoSize = "none";
            this.__id53_.enabled = true;
            this.__id53_.focusable = false;
            this.__id53_.groupName = "";
            this.__id53_.label = "";
            this.__id53_.overlayAlign = "none";
            this.__id53_.overlayImg = "";
            this.__id53_.overlayPadding = {x:0, y:0};
            this.__id53_.selected = false;
            this.__id53_.toggle = true;
            this.__id53_.visible = true;
            try
            {
                this.__id53_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id55__Scene1_components_0()
        {
            try
            {
                this.__id55_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id55_.autoRepeat = false;
            this.__id55_.autoSize = "none";
            this.__id55_.enabled = true;
            this.__id55_.focusable = false;
            this.__id55_.groupName = "";
            this.__id55_.label = "";
            this.__id55_.overlayAlign = "none";
            this.__id55_.overlayImg = "";
            this.__id55_.overlayPadding = {x:0, y:0};
            this.__id55_.selected = false;
            this.__id55_.toggle = false;
            this.__id55_.visible = true;
            try
            {
                this.__id55_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id56__Scene1_components_0()
        {
            try
            {
                this.__id56_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id56_.autoRepeat = false;
            this.__id56_.autoSize = "none";
            this.__id56_.enabled = true;
            this.__id56_.focusable = false;
            this.__id56_.groupName = "";
            this.__id56_.label = "";
            this.__id56_.overlayAlign = "none";
            this.__id56_.overlayImg = "";
            this.__id56_.overlayPadding = {x:0, y:0};
            this.__id56_.selected = false;
            this.__id56_.toggle = false;
            this.__id56_.visible = true;
            try
            {
                this.__id56_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id62__Scene1_components_0()
        {
            try
            {
                this.__id62_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id62_.autoRepeat = false;
            this.__id62_.autoSize = "none";
            this.__id62_.enabled = true;
            this.__id62_.focusable = false;
            this.__id62_.groupName = "";
            this.__id62_.label = "";
            this.__id62_.overlayAlign = "none";
            this.__id62_.overlayImg = "";
            this.__id62_.overlayPadding = {x:0, y:0};
            this.__id62_.selected = false;
            this.__id62_.toggle = false;
            this.__id62_.visible = true;
            try
            {
                this.__id62_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id74__Scene1_components_0()
        {
            try
            {
                this.__id74_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id74_.autoRepeat = false;
            this.__id74_.autoSize = "none";
            this.__id74_.enabled = true;
            this.__id74_.focusable = false;
            this.__id74_.groupName = "";
            this.__id74_.label = "DefaultButton_Sns1";
            this.__id74_.overlayAlign = "none";
            this.__id74_.overlayImg = "";
            this.__id74_.overlayPadding = {x:0, y:0};
            this.__id74_.selected = false;
            this.__id74_.toggle = false;
            this.__id74_.visible = true;
            try
            {
                this.__id74_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp___id75__Scene1_components_0()
        {
            try
            {
                this.__id75_["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.__id75_.autoRepeat = false;
            this.__id75_.autoSize = "none";
            this.__id75_.enabled = true;
            this.__id75_.focusable = false;
            this.__id75_.groupName = "";
            this.__id75_.label = "DefaultButton_Sns2";
            this.__id75_.overlayAlign = "none";
            this.__id75_.overlayImg = "";
            this.__id75_.overlayPadding = {x:0, y:0};
            this.__id75_.selected = false;
            this.__id75_.toggle = false;
            this.__id75_.visible = true;
            try
            {
                this.__id75_["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.buttonBar.dataProvider = new DataProvider(["ButtonBar1", "ButtonBar2", "ButtonBar3"]);
            this.buttonBar.selectedIndex = 0;
            this.optionStepper.dataProvider = new DataProvider(["Option1", "Option2", "Option3", "Option4", "Option5", "Option6", "Option7", "Option8"]);
            this.optionStepper2.dataProvider = new DataProvider(["Option1", "Option2", "Option3", "Option4", "Option5", "Option6", "Option7", "Option8"]);
            this.scrollingList.dataProvider = new DataProvider(["ScrollingList1", "ScrollingList2", "ScrollingList3", "ScrollingList4", "ScrollingList4"]);
            this.scrollingList.selectedIndex = 0;
            this.dropdown.dataProvider = new DataProvider([{label:"DropdownMenu1"}, {label:"DropdownMenu2"}, {label:"DropdownMenu3"}, {label:"DropdownMenu4"}, {label:"DropdownMenu5"}]);
            this.dropdown.selectedIndex = 0;
            this.tileList.dataProvider = new DataProvider(["TileList1", "TileList2", "TileList3", "TileList4", "TileList5", "TileList6", "TileList7", "TileList8", "TileList9", "TileList10"]);
            this.tileList.selectedIndex = 0;
            this.exTileList.list.dataProvider = new DataProvider(["TileList1", "TileList2", "TileList3", "TileList4", "TileList5", "TileList6", "TileList7", "TileList8", "TileList9", "TileList10", "TileList11", "TileList12", "TileList13", "TileList14", "TileList15"]);
            this.exTileList.list.selectedIndex = 0;
            this.treeData = [{label:"Tree", depth:0, leaf:[{label:"Leaf", depth:1, leaf:[{label:"Leaf2", depth:2, leaf:0}, {label:"Leaf2", depth:2, leaf:0}, {label:"Leaf2", depth:2, leaf:0}]}, {label:"Leaf", depth:1, leaf:[{label:"Leaf2", depth:2, leaf:0}, {label:"Leaf2", depth:2, leaf:0}, {label:"Leaf2", depth:2, leaf:0}]}]}, {label:"Tree", depth:0, leaf:[{label:"Leaf", depth:1, leaf:[{label:"Leaf2", depth:2, leaf:0}, {label:"Leaf2", depth:2, leaf:0}, {label:"Leaf2", depth:2, leaf:0}]}, {label:"Leaf", depth:1, leaf:[{label:"Leaf2", depth:2, leaf:0}, {label:"Leaf2", depth:2, leaf:0}, {label:"Leaf2", depth:2, leaf:0}]}]}];
            this.tree.dataProvider = new DataProvider(this.treeData);
            return;
        }// end function

    }
}
