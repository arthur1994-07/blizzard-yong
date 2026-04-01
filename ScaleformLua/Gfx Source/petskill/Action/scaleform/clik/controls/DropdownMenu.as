package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.clik.managers.*;
    import scaleform.clik.ui.*;
    import scaleform.clik.utils.*;

    public class DropdownMenu extends Button
    {
        public var dropdown:Object = "DefaultScrollingList";
        public var itemRenderer:Object = "DefaultListItemRenderer";
        public var scrollBar:Object;
        public var menuWrapping:String = "normal";
        public var menuDirection:String = "down";
        public var menuWidth:Number = -1;
        public var menuMargin:Number = 1;
        public var menuRowCount:Number = 5;
        public var menuRowsFixed:Boolean = true;
        public var menuPadding:Padding;
        public var menuOffset:Padding;
        public var thumbOffsetTop:Number;
        public var thumbOffsetBottom:Number;
        protected var _selectedIndex:int = -1;
        protected var _dataProvider:IDataProvider;
        protected var _labelField:String = "label";
        protected var _labelFunction:Function;
        protected var _popup:MovieClip;
        protected var _dropdownRef:MovieClip = null;
        protected var _defaultLabel:String = "";

        public function DropdownMenu()
        {
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemoveFromStage, false, 0, true);
            return;
        }// end function

        protected function onRemoveFromStage(event:Event) : void
        {
            this.close();
            return;
        }// end function

        override protected function initialize() : void
        {
            this.dataProvider = new DataProvider();
            this.menuOffset = new Padding(0, 0, 0, 0);
            this.menuPadding = new Padding(0, 0, 0, 0);
            super.initialize();
            return;
        }// end function

        override public function get autoRepeat() : Boolean
        {
            return false;
        }// end function

        override public function set autoRepeat(param1:Boolean) : void
        {
            return;
        }// end function

        override public function get data() : Object
        {
            return null;
        }// end function

        override public function set data(param1:Object) : void
        {
            return;
        }// end function

        override public function get label() : String
        {
            return "";
        }// end function

        override public function set label(param1:String) : void
        {
            return;
        }// end function

        override public function get selected() : Boolean
        {
            return super.selected;
        }// end function

        override public function set selected(param1:Boolean) : void
        {
            super.selected = param1;
            return;
        }// end function

        override public function get toggle() : Boolean
        {
            return super.toggle;
        }// end function

        override public function set toggle(param1:Boolean) : void
        {
            super.toggle = param1;
            return;
        }// end function

        public function get defaultLabel() : String
        {
            return this._defaultLabel;
        }// end function

        public function set defaultLabel(param1:String)
        {
            this._defaultLabel = param1;
            invalidateData();
            return;
        }// end function

        public function set inspectableMenuPadding(param1:Object) : void
        {
            if (!componentInspectorSetting)
            {
                return;
            }
            this.menuPadding = new Padding(param1.top, param1.right, param1.bottom, param1.left);
            return;
        }// end function

        public function set inspectableMenuOffset(param1:Object) : void
        {
            if (!componentInspectorSetting)
            {
                return;
            }
            this.menuOffset = new Padding(param1.top, param1.right, param1.bottom, param1.left);
            return;
        }// end function

        public function set inspectableThumbOffset(param1:Object) : void
        {
            if (!componentInspectorSetting)
            {
                return;
            }
            this.thumbOffsetTop = Number(param1.top);
            this.thumbOffsetBottom = Number(param1.bottom);
            return;
        }// end function

        override public function get focusable() : Boolean
        {
            return _focusable;
        }// end function

        override public function set focusable(param1:Boolean) : void
        {
            super.focusable = param1;
            return;
        }// end function

        public function get selectedIndex() : int
        {
            return this._selectedIndex;
        }// end function

        public function set selectedIndex(param1:int) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = 0;
            if (this._selectedIndex == param1)
            {
                return;
            }
            this._selectedIndex = param1;
            this.invalidateSelectedIndex();
            if (this._dropdownRef != null)
            {
                _loc_2 = this._dropdownRef as CoreList;
                _loc_3 = _loc_2 is ScrollingList ? ((_loc_2 as ScrollingList).scrollPosition) : (0);
                dispatchEventAndSound(new ListEvent(ListEvent.INDEX_CHANGE, true, false, this._selectedIndex, -1, -1, _loc_2.getRendererAt(this._selectedIndex, _loc_3), this._dataProvider[this._selectedIndex]));
            }
            return;
        }// end function

        public function get dataProvider() : IDataProvider
        {
            return this._dataProvider;
        }// end function

        public function set dataProvider(param1:IDataProvider) : void
        {
            if (this._dataProvider == param1)
            {
                return;
            }
            if (this._dataProvider != null)
            {
                this._dataProvider.removeEventListener(Event.CHANGE, this.handleDataChange, false);
            }
            this._dataProvider = param1;
            var _loc_2:* = this._dataProvider.length;
            if (!this.menuRowsFixed && _loc_2 > 0 && _loc_2 < this.menuRowCount)
            {
                this.menuRowCount = _loc_2;
            }
            if (this._dataProvider == null)
            {
                return;
            }
            this._dataProvider.addEventListener(Event.CHANGE, this.handleDataChange, false, 0, true);
            invalidateData();
            return;
        }// end function

        public function get labelField() : String
        {
            return this._labelField;
        }// end function

        public function set labelField(param1:String) : void
        {
            this._labelField = param1;
            invalidateData();
            return;
        }// end function

        public function get labelFunction() : Function
        {
            return this._labelFunction;
        }// end function

        public function set labelFunction(param1:Function) : void
        {
            this._labelFunction = param1;
            invalidateData();
            return;
        }// end function

        public function itemToLabel(param1:Object) : String
        {
            if (param1 == null)
            {
                return "";
            }
            if (this._labelFunction != null)
            {
                return this._labelFunction(param1);
            }
            if (param1 is String)
            {
                return param1.toString();
            }
            if (this._labelField != null && param1[this._labelField] != null)
            {
                return param1[this._labelField];
            }
            return param1.toString();
        }// end function

        public function open() : void
        {
            this.selected = true;
            stage.addEventListener(MouseEvent.MOUSE_DOWN, this.handleStageClick, false, 0, true);
            this.showDropdown();
            return;
        }// end function

        public function close() : void
        {
            this.selected = false;
            if (stage)
            {
                stage.removeEventListener(MouseEvent.MOUSE_DOWN, this.handleStageClick, false);
            }
            this.hideDropdown();
            return;
        }// end function

        public function isOpen() : Boolean
        {
            return this._dropdownRef != null;
        }// end function

        public function invalidateSelectedIndex() : void
        {
            invalidate(InvalidationType.SELECTED_INDEX);
            return;
        }// end function

        override public function handleInput(event:InputEvent) : void
        {
            if (event.handled)
            {
                return;
            }
            if (this._dropdownRef != null && this.selected)
            {
                this._dropdownRef.handleInput(event);
                if (event.handled)
                {
                    return;
                }
            }
            super.handleInput(event);
            var _loc_2:* = event.details;
            var _loc_3:* = _loc_2.value == InputValue.KEY_DOWN;
            switch(_loc_2.navEquivalent)
            {
                case NavigationCode.ESCAPE:
                {
                    if (this.selected)
                    {
                        if (_loc_3)
                        {
                            this.close();
                        }
                        event.handled = true;
                    }
                }
                default:
                {
                    break;
                    break;
                }
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK DropdownMenu " + name + "]";
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.SELECTED_INDEX) || isInvalid(InvalidationType.DATA))
            {
                this._dataProvider.requestItemAt(this._selectedIndex, this.populateText);
                invalidateData();
            }
            super.draw();
            return;
        }// end function

        override protected function changeFocus() : void
        {
            super.changeFocus();
            if (_selected && this._dropdownRef)
            {
                this.close();
            }
            return;
        }// end function

        override protected function handleClick(param1:uint = 0) : void
        {
            if (!_selected)
            {
                this.open();
            }
            else
            {
                this.close();
            }
            super.handleClick();
            return;
        }// end function

        protected function handleDataChange(event:Event) : void
        {
            invalidate(InvalidationType.DATA);
            return;
        }// end function

        protected function populateText(param1:Object) : void
        {
            this.updateLabel(param1);
            dispatchEventAndSound(new Event(Event.CHANGE));
            return;
        }// end function

        protected function updateLabel(param1:Object) : void
        {
            var _loc_2:* = this.itemToLabel(param1);
            if (_loc_2 == null || _loc_2 == "")
            {
                _label = this._defaultLabel;
            }
            else
            {
                _label = _loc_2;
            }
            return;
        }// end function

        protected function handleStageClick(event:MouseEvent) : void
        {
            if (this.contains(event.target as DisplayObject))
            {
                return;
            }
            if (this._dropdownRef.contains(event.target as DisplayObject))
            {
                return;
            }
            this.close();
            return;
        }// end function

        protected function showDropdown() : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            if (this.dropdown == null)
            {
                return;
            }
            var _loc_1:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_1 = loaderInfo.applicationDomain;
            }
            if (this.dropdown is String && this.dropdown != "")
            {
                _loc_3 = _loc_1.getDefinition(this.dropdown.toString()) as Class;
                if (_loc_3 != null)
                {
                    _loc_2 = new _loc_3 as CoreList;
                }
            }
            if (_loc_2)
            {
                if (this.itemRenderer is String && this.itemRenderer != "")
                {
                    _loc_2.itemRenderer = _loc_1.getDefinition(this.itemRenderer.toString()) as Class;
                }
                else if (this.itemRenderer is Class)
                {
                    _loc_2.itemRenderer = this.itemRenderer as Class;
                }
                if (this.scrollBar is String && this.scrollBar != "")
                {
                    _loc_2.scrollBar = _loc_1.getDefinition(this.scrollBar.toString()) as Class;
                }
                else if (this.scrollBar is Class)
                {
                    _loc_2.scrollBar = this.scrollBar as Class;
                }
                _loc_2.selectedIndex = this._selectedIndex;
                _loc_2.width = this.menuWidth == -1 ? (width + this.menuOffset.left + this.menuOffset.right) : (this.menuWidth);
                _loc_2.dataProvider = this._dataProvider;
                _loc_2.padding = this.menuPadding;
                _loc_2.wrapping = this.menuWrapping;
                _loc_2.margin = this.menuMargin;
                _loc_2.thumbOffset = {top:this.thumbOffsetTop, bottom:this.thumbOffsetBottom};
                _loc_2.focusTarget = this;
                _loc_2.rowCount = this.menuRowCount < 1 ? (5) : (this.menuRowCount);
                _loc_2.labelField = this._labelField;
                _loc_2.labelFunction = this._labelFunction;
                _loc_2.idUsedByDropDown = true;
                _loc_2.addEventListener(ListEvent.ITEM_CLICK, this.handleMenuItemClick, false, 0, true);
                _loc_2.addEventListener(ListEvent.ITEM_ROLL_OVER, this.onItemRollOver, false, 0, true);
                _loc_2.addEventListener(ListEvent.ITEM_ROLL_OUT, this.onItemRollOut, false, 0, true);
                this._dropdownRef = _loc_2;
                PopUpManager.show(_loc_2, x + this.menuOffset.left, this.menuDirection == "down" ? (y + height + this.menuOffset.top) : (y - this._dropdownRef.height + this.menuOffset.bottom), parent);
            }
            return;
        }// end function

        protected function onItemRollOver(event:ListEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        protected function onItemRollOut(event:ListEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        protected function hideDropdown() : void
        {
            if (this._dropdownRef)
            {
                this._dropdownRef.parent.removeChild(this._dropdownRef);
                this._dropdownRef = null;
            }
            return;
        }// end function

        protected function handleMenuItemClick(event:ListEvent) : void
        {
            this.selectedIndex = event.index;
            this.close();
            return;
        }// end function

        override public function updateText() : void
        {
            var _loc_1:* = NaN;
            var _loc_2:* = null;
            var _loc_3:* = 0;
            if (_label != null && textField != null)
            {
                textField.htmlText = _label;
                _loc_1 = textField.width * this.scaleX;
                if (_loc_1 < textField.textWidth)
                {
                    _loc_2 = textField.text;
                    TooltipHtmlText = _loc_2;
                    _loc_3 = 0;
                    while (_loc_3 < _loc_2.length)
                    {
                        
                        textField.text = _loc_2.substr(0, _loc_2.length - _loc_3) + "...";
                        if (_loc_1 - 4 > textField.textWidth)
                        {
                            break;
                        }
                        _loc_3++;
                    }
                }
                else
                {
                    TooltipHtmlText = "";
                }
            }
            return;
        }// end function

    }
}
