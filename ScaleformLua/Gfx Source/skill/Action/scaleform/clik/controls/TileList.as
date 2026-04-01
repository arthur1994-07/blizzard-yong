package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.clik.ui.*;
    import scaleform.clik.utils.*;

    public class TileList extends CoreList
    {
        public var wrapping:String = "normal";
        public var thumbOffset:Object;
        public var thumbSizeFactor:Number = 1;
        public var externalColumnCount:Number = 0;
        protected var _rowHeight:Number = NaN;
        protected var _autoRowHeight:Number = NaN;
        protected var _totalRows:Number = 0;
        protected var _columnWidth:Number = NaN;
        protected var _autoColumnWidth:Number = NaN;
        protected var _totalColumns:uint = 0;
        protected var _scrollPosition:uint = 0;
        protected var _autoScrollBar:Boolean = false;
        protected var _scrollBarValue:Object;
        protected var _margin:Number = 0;
        protected var _padding:Padding;
        protected var _direction:String = "horizontal";
        protected var _siWidth:Number = 0;
        protected var _scrollBar:IScrollBar;

        public function TileList()
        {
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        public function get scrollBar() : Object
        {
            return this._scrollBar;
        }// end function

        public function set scrollBar(param1:Object) : void
        {
            this._scrollBarValue = param1;
            invalidate(InvalidationType.SCROLL_BAR);
            return;
        }// end function

        public function get rowHeight() : Number
        {
            return isNaN(this._autoRowHeight) ? (this._rowHeight) : (this._autoRowHeight);
        }// end function

        public function set rowHeight(param1:Number) : void
        {
            if (param1 == 0)
            {
                param1 = NaN;
                if (_inspector)
                {
                    return;
                }
            }
            this._rowHeight = param1;
            this._autoRowHeight = NaN;
            invalidateSize();
            return;
        }// end function

        public function get columnWidth() : Number
        {
            return isNaN(this._autoColumnWidth) ? (this._columnWidth) : (this._autoColumnWidth);
        }// end function

        public function set columnWidth(param1:Number) : void
        {
            if (param1 == 0)
            {
                param1 = NaN;
                if (_inspector)
                {
                    return;
                }
            }
            this._columnWidth = param1;
            this._autoColumnWidth = NaN;
            invalidateSize();
            return;
        }// end function

        public function get rowCount() : uint
        {
            return this._totalRows;
        }// end function

        public function set rowCount(param1:uint) : void
        {
            var _loc_2:* = this.rowHeight;
            if (isNaN(_loc_2))
            {
                this.calculateRendererTotal(this.availableWidth, this.availableHeight);
                _loc_2 = this.rowHeight;
            }
            height = _loc_2 * param1 + this.margin * 2 + this.padding.vertical + (this._direction == DirectionMode.HORIZONTAL && this._autoScrollBar ? (Math.round(this._siWidth)) : (0));
            return;
        }// end function

        public function get columnCount() : uint
        {
            return this._totalColumns;
        }// end function

        public function set columnCount(param1:uint) : void
        {
            var _loc_2:* = this.columnWidth;
            if (isNaN(_loc_2))
            {
                this.calculateRendererTotal(this.availableWidth, this.availableHeight);
                _loc_2 = this.columnWidth;
            }
            width = _loc_2 * param1 + this.margin * 2 + this.padding.horizontal + (this._direction == DirectionMode.VERTICAL && this._autoScrollBar ? (Math.round(this._siWidth)) : (0));
            return;
        }// end function

        public function get direction() : String
        {
            return this._direction;
        }// end function

        public function set direction(param1:String) : void
        {
            if (param1 == this._direction)
            {
                return;
            }
            this._direction = param1;
            invalidate();
            return;
        }// end function

        override public function set selectedIndex(param1:int) : void
        {
            if (param1 == _selectedIndex || param1 == _newSelectedIndex)
            {
                return;
            }
            _newSelectedIndex = param1;
            invalidateSelectedIndex();
            return;
        }// end function

        public function get margin() : Number
        {
            return this._margin;
        }// end function

        public function set margin(param1:Number) : void
        {
            this._margin = param1;
            invalidateSize();
            return;
        }// end function

        public function get padding() : Padding
        {
            return this._padding;
        }// end function

        public function set padding(param1:Padding) : void
        {
            this._padding = param1;
            invalidateSize();
            return;
        }// end function

        public function set inspectablePadding(param1:Object) : void
        {
            if (!componentInspectorSetting)
            {
                return;
            }
            this.padding = new Padding(param1.top, param1.right, param1.bottom, param1.left);
            return;
        }// end function

        override public function get availableWidth() : Number
        {
            return Math.round(_width) - this.padding.horizontal - this.margin * 2 - (this._direction == DirectionMode.VERTICAL && this._autoScrollBar ? (Math.round(this._siWidth)) : (0));
        }// end function

        override public function get availableHeight() : Number
        {
            return Math.round(_height) - this.padding.vertical - this.margin * 2 - (this._direction == DirectionMode.HORIZONTAL && this._autoScrollBar ? (Math.round(this._siWidth)) : (0));
        }// end function

        public function get scrollPosition() : Number
        {
            return this._scrollPosition;
        }// end function

        public function set scrollPosition(param1:Number) : void
        {
            var _loc_2:* = Math.ceil((_dataProvider.length - this._totalRows * this._totalColumns) / (this._direction == DirectionMode.HORIZONTAL ? (this._totalRows) : (this._totalColumns)));
            param1 = Math.max(0, Math.min(_loc_2, Math.round(param1)));
            if (this._scrollPosition == param1)
            {
                return;
            }
            this._scrollPosition = param1;
            invalidateData();
            return;
        }// end function

        override public function getRendererAt(param1:uint, param2:int = 0) : IListItemRenderer
        {
            if (_renderers == null)
            {
                return null;
            }
            var _loc_3:* = param1 - param2 * (this._direction == DirectionMode.HORIZONTAL ? (this._totalRows) : (this._totalColumns));
            if (_loc_3 >= _renderers.length)
            {
                return null;
            }
            return _renderers[_loc_3] as IListItemRenderer;
        }// end function

        override public function scrollToIndex(param1:uint) : void
        {
            if (_totalRenderers == 0)
            {
                return;
            }
            var _loc_2:* = this._direction == DirectionMode.HORIZONTAL ? (this._totalRows) : (this._totalColumns);
            var _loc_3:* = this._scrollPosition * _loc_2;
            if (_loc_2 == 0)
            {
                return;
            }
            if (param1 >= _loc_3 && param1 < _loc_3 + this._totalRows * this._totalColumns)
            {
                return;
            }
            if (param1 < _loc_3)
            {
                this.scrollPosition = param1 / _loc_2 >> 0;
            }
            else
            {
                this.scrollPosition = Math.floor(param1 / _loc_2) - (this._direction == DirectionMode.HORIZONTAL ? (this._totalColumns) : (this._totalRows)) + 1;
            }
            return;
        }// end function

        override public function handleInput(event:InputEvent) : void
        {
            if (event.handled)
            {
                return;
            }
            var _loc_2:* = this.getRendererAt(_selectedIndex, this._scrollPosition);
            if (_loc_2 != null)
            {
                _loc_2.handleInput(event);
                if (event.handled)
                {
                    return;
                }
            }
            var _loc_3:* = event.details;
            var _loc_4:* = _loc_3.value == InputValue.KEY_DOWN || _loc_3.value == InputValue.KEY_HOLD;
            var _loc_5:* = -1;
            var _loc_6:* = _loc_3.navEquivalent;
            switch(_loc_6)
            {
                case NavigationCode.RIGHT:
                {
                    break;
                }
                case NavigationCode.LEFT:
                {
                    break;
                }
                case NavigationCode.UP:
                {
                    break;
                }
                case NavigationCode.DOWN:
                {
                    break;
                }
                default:
                {
                    break;
                }
            }
            switch(_loc_6)
            {
                case NavigationCode.DOWN:
                {
                    break;
                }
                case NavigationCode.UP:
                {
                    break;
                }
                case NavigationCode.LEFT:
                {
                    break;
                }
                case NavigationCode.RIGHT:
                {
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (_loc_5 == -1)
            {
                switch(_loc_6)
                {
                    case NavigationCode.HOME:
                    {
                        _loc_5 = 0;
                        break;
                    }
                    case NavigationCode.END:
                    {
                        _loc_5 = _dataProvider.length - 1;
                        break;
                    }
                    case NavigationCode.PAGE_DOWN:
                    {
                        _loc_5 = Math.min((_dataProvider.length - 1), _selectedIndex + this._totalColumns * this._totalRows);
                        break;
                    }
                    case NavigationCode.PAGE_UP:
                    {
                        _loc_5 = Math.max(0, _selectedIndex - this._totalColumns * this._totalRows);
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            if (_loc_5 != -1)
            {
                if (!_loc_4)
                {
                    event.handled = true;
                    return;
                }
                if (_loc_5 >= 0 && _loc_5 < dataProvider.length)
                {
                    this.selectedIndex = Math.max(0, Math.min((_dataProvider.length - 1), _loc_5));
                    event.handled = true;
                }
                else if (this.wrapping == WrappingMode.STICK)
                {
                    _loc_5 = Math.max(0, Math.min((_dataProvider.length - 1), _loc_5));
                    if (selectedIndex != _loc_5)
                    {
                        this.selectedIndex = _loc_5;
                    }
                    event.handled = true;
                }
                else if (this.wrapping == WrappingMode.WRAP)
                {
                    this.selectedIndex = _loc_5 < 0 ? ((_dataProvider.length - 1)) : (selectedIndex < (_dataProvider.length - 1) ? ((_dataProvider.length - 1)) : (0));
                    event.handled = true;
                }
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK TileList " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            if (this.padding == null)
            {
                this.padding = new Padding();
            }
            if (_itemRenderer == null && !_usingExternalRenderers)
            {
                itemRendererName = _itemRendererName;
            }
            labelFunction = this.SetLabelText;
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.SCROLL_BAR))
            {
                this.createScrollBar();
            }
            if (isInvalid(InvalidationType.RENDERERS))
            {
                this._autoRowHeight = NaN;
                this._autoColumnWidth = NaN;
                if (_usingExternalRenderers)
                {
                    this._totalColumns = this.externalColumnCount == 0 ? (1) : (this.externalColumnCount);
                    this._totalRows = Math.ceil(_renderers.length / this._totalColumns);
                }
            }
            super.draw();
            if (isInvalid(InvalidationType.DATA))
            {
                this.updateScrollBar();
            }
            return;
        }// end function

        protected function createScrollBar() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (this._scrollBar)
            {
                this._scrollBar.removeEventListener(Event.SCROLL, this.handleScroll);
                this._scrollBar.removeEventListener(Event.CHANGE, this.handleScroll);
                this._scrollBar.focusTarget = null;
                if (container.contains(this._scrollBar as DisplayObject))
                {
                    container.removeChild(this._scrollBar as DisplayObject);
                }
                this._scrollBar = null;
            }
            if (!this._scrollBarValue || this._scrollBarValue == "")
            {
                return;
            }
            this._autoScrollBar = false;
            if (this._scrollBarValue is String)
            {
                if (parent != null)
                {
                    _loc_1 = parent.getChildByName(this._scrollBarValue.toString()) as IScrollBar;
                }
                if (_loc_1 == null)
                {
                    _loc_2 = ApplicationDomain.currentDomain;
                    if (loaderInfo != null && loaderInfo.applicationDomain != null)
                    {
                        _loc_2 = loaderInfo.applicationDomain;
                    }
                    _loc_3 = _loc_2.getDefinition(this._scrollBarValue.toString()) as Class;
                    if (_loc_3)
                    {
                        _loc_1 = new _loc_3 as IScrollBar;
                    }
                    if (_loc_1)
                    {
                        this._autoScrollBar = true;
                        _loc_4 = _loc_1 as Object;
                        if (_loc_4 && this.thumbOffset)
                        {
                            _loc_4.offsetTop = this.thumbOffset.top;
                            _loc_4.offsetBottom = this.thumbOffset.bottom;
                        }
                        _loc_1.addEventListener(MouseEvent.MOUSE_WHEEL, this.blockMouseWheel, false, 0, true);
                        container.addChild(_loc_1 as DisplayObject);
                    }
                }
            }
            else if (this._scrollBarValue is Class)
            {
                _loc_1 = new (this._scrollBarValue as Class)() as IScrollBar;
                _loc_1.addEventListener(MouseEvent.MOUSE_WHEEL, this.blockMouseWheel, false, 0, true);
                if (_loc_1 != null)
                {
                    this._autoScrollBar = true;
                    (_loc_4).offsetTop = this.thumbOffset.top;
                    (_loc_4).offsetBottom = this.thumbOffset.bottom;
                    container.addChild(_loc_1 as DisplayObject);
                }
            }
            else
            {
                _loc_1 = this._scrollBarValue as IScrollBar;
            }
            this._scrollBar = _loc_1;
            this._siWidth = this._scrollBar.width;
            invalidateSize();
            if (this._scrollBar == null)
            {
                return;
            }
            this._scrollBar.addEventListener(Event.SCROLL, this.handleScroll, false, 0, true);
            this._scrollBar.addEventListener(Event.CHANGE, this.handleScroll, false, 0, true);
            this._scrollBar.focusTarget = this;
            this._scrollBar.tabEnabled = false;
            return;
        }// end function

        override protected function calculateRendererTotal(param1:Number, param2:Number) : uint
        {
            var _loc_5:* = null;
            var _loc_3:* = isNaN(this._rowHeight) && isNaN(this._autoRowHeight);
            var _loc_4:* = isNaN(this._columnWidth) && isNaN(this._autoColumnWidth);
            if (_loc_3 || _loc_4)
            {
                _loc_5 = createRenderer(0);
                if (_loc_3)
                {
                    this._autoRowHeight = _loc_5.height;
                }
                if (_loc_4)
                {
                    this._autoColumnWidth = _loc_5.width;
                }
                cleanUpRenderer(_loc_5);
            }
            this._totalRows = this.availableHeight / this.rowHeight >> 0;
            this._totalColumns = this.availableWidth / this.columnWidth >> 0;
            _totalRenderers = this._totalRows * this._totalColumns;
            return _totalRenderers;
        }// end function

        override protected function updateSelectedIndex(param1:Boolean = false) : void
        {
            if (_selectedIndex == _newSelectedIndex)
            {
                return;
            }
            if (_totalRenderers == 0)
            {
                return;
            }
            var _loc_2:* = this.getRendererAt(_selectedIndex, this.scrollPosition);
            if (_loc_2 != null)
            {
                _loc_2.selected = false;
                _loc_2.validateNow();
            }
            super.selectedIndex = _newSelectedIndex;
            if (_selectedIndex < 0 || _selectedIndex >= _dataProvider.length)
            {
                return;
            }
            _loc_2 = this.getRendererAt(_selectedIndex, this._scrollPosition);
            if (_loc_2 != null)
            {
                _loc_2.selected = true;
                _loc_2.validateNow();
            }
            else
            {
                this.scrollToIndex(_selectedIndex);
                _loc_2 = this.getRendererAt(_selectedIndex, this.scrollPosition);
                if (_loc_2)
                {
                    _loc_2.selected = true;
                    _loc_2.validateNow();
                }
            }
            return;
        }// end function

        override protected function refreshData() : void
        {
            var _loc_1:* = this._direction == DirectionMode.HORIZONTAL ? (this._totalRows) : (this._totalColumns);
            var _loc_2:* = Math.ceil(_dataProvider.length / _loc_1);
            var _loc_3:* = _loc_2 - (this._direction == DirectionMode.HORIZONTAL ? (this._totalColumns) : (this._totalRows));
            this._scrollPosition = Math.max(0, Math.min(_loc_3, this._scrollPosition));
            var _loc_4:* = this._scrollPosition * _loc_1;
            var _loc_5:* = this._scrollPosition * _loc_1 + this._totalColumns * this._totalRows - 1;
            this.selectedIndex = Math.min((_dataProvider.length - 1), _selectedIndex);
            this.updateSelectedIndex();
            _dataProvider.requestItemRange(_loc_4, _loc_5, this.populateData);
            return;
        }// end function

        override protected function drawLayout() : void
        {
            var _loc_8:* = null;
            var _loc_1:* = _renderers.length;
            var _loc_2:* = this.rowHeight;
            var _loc_3:* = this.columnWidth;
            var _loc_4:* = this.margin + this.padding.left;
            var _loc_5:* = this.margin + this.padding.top;
            var _loc_6:* = isInvalid(InvalidationType.DATA);
            var _loc_7:* = 0;
            while (_loc_7 < _loc_1)
            {
                
                _loc_8 = this.getRendererAt(_loc_7);
                if (this.direction == DirectionMode.VERTICAL)
                {
                    _loc_8.y = _loc_7 % this._totalRows * _loc_2 + _loc_5;
                    _loc_8.x = (_loc_7 / this._totalRows >> 0) * _loc_3 + _loc_4;
                }
                else
                {
                    _loc_8.x = _loc_7 % this._totalColumns * _loc_3 + _loc_4;
                    _loc_8.y = (_loc_7 / this._totalColumns >> 0) * _loc_2 + _loc_5;
                }
                _loc_8.width = _loc_3;
                _loc_8.height = _loc_2;
                if (!_loc_6)
                {
                    _loc_8.validateNow();
                }
                _loc_7 = _loc_7 + 1;
            }
            this.drawScrollBar();
            return;
        }// end function

        override protected function changeFocus() : void
        {
            super.changeFocus();
            return;
        }// end function

        protected function populateData(param1:Array) : void
        {
            var _loc_5:* = null;
            var _loc_6:* = 0;
            var _loc_7:* = null;
            var _loc_2:* = param1.length;
            var _loc_3:* = _renderers.length;
            var _loc_4:* = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = this.getRendererAt(_loc_4);
                _loc_6 = this._scrollPosition * (this._direction == DirectionMode.HORIZONTAL ? (this._totalRows) : (this._totalColumns)) + _loc_4;
                _loc_7 = new ListData(_loc_6, itemToLabel(param1[_loc_4]), _selectedIndex == _loc_6);
                _loc_5.enabled = _loc_4 >= _loc_2 ? (false) : (true);
                _loc_5.setListData(_loc_7);
                _loc_5.setData(param1[_loc_4]);
                _loc_5.validateNow();
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        protected function drawScrollBar() : void
        {
            if (!this._autoScrollBar)
            {
                return;
            }
            var _loc_1:* = this._scrollBar as ScrollIndicator;
            _loc_1.direction = this._direction;
            if (this._direction == DirectionMode.VERTICAL)
            {
                _loc_1.rotation = 0;
                _loc_1.x = _width - _loc_1.width + this.margin;
                _loc_1.y = this.margin;
                _loc_1.height = this.availableHeight + this.padding.vertical;
            }
            else
            {
                _loc_1.rotation = -90;
                _loc_1.x = this.margin;
                _loc_1.y = _height - this.margin;
                _loc_1.width = this.availableWidth + this.padding.horizontal;
            }
            this._scrollBar.validateNow();
            return;
        }// end function

        protected function updateScrollBar() : void
        {
            var _loc_1:* = NaN;
            var _loc_2:* = null;
            if (this._scrollBar == null)
            {
                return;
            }
            if (this.direction == DirectionMode.HORIZONTAL)
            {
                _loc_1 = Math.ceil(_dataProvider.length / this._totalRows) - this._totalColumns;
            }
            else
            {
                _loc_1 = Math.ceil(_dataProvider.length / this._totalColumns) - this._totalRows;
            }
            if (this._scrollBar is ScrollIndicator)
            {
                _loc_2 = this._scrollBar as ScrollIndicator;
                _loc_2.setScrollProperties(this._direction == DirectionMode.HORIZONTAL ? (this._totalColumns) : (this._totalRows), 0, _loc_1);
            }
            this._scrollBar.position = this._scrollPosition;
            this._scrollBar.validateNow();
            return;
        }// end function

        protected function handleScroll(event:Event) : void
        {
            this.scrollPosition = this._scrollBar.position;
            return;
        }// end function

        override protected function scrollList(param1:int) : void
        {
            this.scrollPosition = this.scrollPosition - param1;
            return;
        }// end function

        protected function blockMouseWheel(event:MouseEvent) : void
        {
            event.stopPropagation();
            return;
        }// end function

        public function SetLabelText(param1:Object) : Array
        {
            var _loc_4:* = null;
            if (param1 == null)
            {
                return [""];
            }
            if (param1 is String)
            {
                return [param1];
            }
            var _loc_2:* = [];
            var _loc_3:* = 0;
            while (true)
            {
                
                _loc_3++;
                _loc_4 = null;
                if (_loc_3 == 1 && param1[_labelField])
                {
                    _loc_4 = param1[_labelField];
                }
                else
                {
                    _loc_4 = param1[_labelField + _loc_3];
                }
                if (!_loc_4)
                {
                    break;
                }
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

    }
}
