package Product_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var productList:ProductList;
        public var ProductAutoCompleteTB:AutocompleteTextBox;
        public var Goods:UIComponent;
        public var HelpBtn:Button;
        public var ShowSkillCheckBox:CheckBox;
        public var ShowProductAbleCheckBox:CheckBox;
        public var ShowSkillCheckBox_text:Label;
        public var ShowProductAbleCheckBox_text:Label;
        public var TypeListTextBox:Label;
        public var GoodsNameTextBox:Label;
        public var StudyPointTextBox:Label;
        public var ProductFirterDropDownMenu:DropdownMenu;
        public var btnSearchText:Button;
        public var ProductTypeList:UIComponent;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ProductFirterDropDownMenu_Scene1_Button_0();
            this.__setProp_HelpBtn_Scene1_Button_0();
            this.__setProp_StudyPointTextBox_Scene1_Text_0();
            this.__setProp_TypeListTextBox_Scene1_Text_0();
            this.__setProp_GoodsNameTextBox_Scene1_Text_0();
            return;
        }// end function

        function __setProp_ProductFirterDropDownMenu_Scene1_Button_0()
        {
            try
            {
                this.ProductFirterDropDownMenu["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ProductFirterDropDownMenu.autoSize = "none";
            this.ProductFirterDropDownMenu.dropdown = "ProductFirterScrollingList";
            this.ProductFirterDropDownMenu.enabled = true;
            this.ProductFirterDropDownMenu.focusable = false;
            this.ProductFirterDropDownMenu.groupName = "";
            this.ProductFirterDropDownMenu.itemRenderer = "DefaultListItemRenderer";
            this.ProductFirterDropDownMenu.menuDirection = "down";
            this.ProductFirterDropDownMenu.menuMargin = 1;
            this.ProductFirterDropDownMenu.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.ProductFirterDropDownMenu.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.ProductFirterDropDownMenu.menuRowCount = 5;
            this.ProductFirterDropDownMenu.menuRowsFixed = false;
            this.ProductFirterDropDownMenu.menuWidth = -1;
            this.ProductFirterDropDownMenu.menuWrapping = "normal";
            this.ProductFirterDropDownMenu.overlayAlign = "none";
            this.ProductFirterDropDownMenu.overlayImg = "";
            this.ProductFirterDropDownMenu.overlayPadding = {x:0, y:0};
            this.ProductFirterDropDownMenu.scrollBar = "DefaultScrollBar";
            this.ProductFirterDropDownMenu.inspectableThumbOffset = {top:0, bottom:0};
            this.ProductFirterDropDownMenu.visible = true;
            try
            {
                this.ProductFirterDropDownMenu["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_HelpBtn_Scene1_Button_0()
        {
            try
            {
                this.HelpBtn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.HelpBtn.autoRepeat = false;
            this.HelpBtn.autoSize = "none";
            this.HelpBtn.enabled = true;
            this.HelpBtn.focusable = false;
            this.HelpBtn.groupName = "";
            this.HelpBtn.label = "?";
            this.HelpBtn.overlayAlign = "none";
            this.HelpBtn.overlayImg = "";
            this.HelpBtn.overlayPadding = {x:0, y:0};
            this.HelpBtn.selected = false;
            this.HelpBtn.toggle = false;
            this.HelpBtn.visible = true;
            try
            {
                this.HelpBtn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_StudyPointTextBox_Scene1_Text_0()
        {
            try
            {
                this.StudyPointTextBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.StudyPointTextBox.autoSize = "left";
            this.StudyPointTextBox.autoSizeEnable = false;
            this.StudyPointTextBox.enabled = true;
            this.StudyPointTextBox.text = "";
            this.StudyPointTextBox.visible = true;
            try
            {
                this.StudyPointTextBox["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TypeListTextBox_Scene1_Text_0()
        {
            try
            {
                this.TypeListTextBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TypeListTextBox.autoSize = "center";
            this.TypeListTextBox.autoSizeEnable = false;
            this.TypeListTextBox.enabled = true;
            this.TypeListTextBox.text = "";
            this.TypeListTextBox.visible = true;
            try
            {
                this.TypeListTextBox["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_GoodsNameTextBox_Scene1_Text_0()
        {
            try
            {
                this.GoodsNameTextBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.GoodsNameTextBox.autoSize = "center";
            this.GoodsNameTextBox.autoSizeEnable = false;
            this.GoodsNameTextBox.enabled = true;
            this.GoodsNameTextBox.text = "";
            this.GoodsNameTextBox.visible = true;
            try
            {
                this.GoodsNameTextBox["componentInspectorSetting"] = false;
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
