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

    public class ScrollingList extends CoreList
    {
        public var wrapping:String = "normal";
        public var thumbOffset:Object;
        public var thumbSizeFactor:Number = 1;
        public var idUsedByDropDown:Boolean = false;
        protected var _rowHeight:Number = NaN;
        protected var _autoRowHeight:Number = NaN;
        protected var _rowCount:Number = NaN;
        protected var _scrollPosition:uint = 0;
        protected var _autoScrollBar:Boolean = false;
        protected var _scrollBarValue:Object;
        protected var _margin:Number = 0;
        protected var _padding:Padding;
        protected var _scrollBar:IScrollBar;
        protected var _treeContainer:Sprite;
        protected var _treeButtonClassName:String;
        protected var _treeButtonClass:Class;
        protected var _treeButtons:Array;
        protected var _treeCheckBoxClassName:String;
        protected var _treeCheckBoxClass:Class;
        protected var _treeCheckBoxes:Array;
        protected var _treeList:Object = false;
        public var itemClickExpand:Boolean = true;
        protected var _treeButtonGap:Number = -1;
        protected var _ImmediateUpdateSelectIndex:Boolean = false;

        public function ScrollingList()
        {
            this._treeButtons = [];
            this._treeCheckBoxes = [];
            return;
        }// end function

        override public function set dataProvider(param1:IDataProvider) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = null;
            if (_dataProvider == param1)
            {
                return;
            }
            if (_dataProvider != null)
            {
                _dataProvider.removeEventListener(Event.CHANGE, handleDataChange, false);
            }
            _dataProvider = param1;
            if (_dataProvider == null)
            {
                return;
            }
            if (multiSelect == true)
            {
                _loc_2 = 0;
                while (_loc_2 < _dataProvider.length)
                {
                    
                    _loc_3 = _dataProvider[_loc_2];
                    if (undefined == _loc_3["multiSelected"])
                    {
                        _loc_3["multiSelected"] = false;
                    }
                    else if (_loc_3["multiSelected"] == "0" || _loc_3["multiSelected"] == 0)
                    {
                        _loc_3["multiSelected"] = false;
                    }
                    else
                    {
                        _loc_3["multiSelected"] = true;
                    }
                    _loc_2++;
                }
            }
            _dataProvider.addEventListener(Event.CHANGE, handleDataChange, false, 0, true);
            if (this.treeList == true)
            {
                this.refreshData();
                this.updateScrollBar();
            }
            else
            {
                invalidateData();
            }
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        public function set treeList(param1:Boolean) : void
        {
            this._treeList = param1;
            if (this._treeList == true)
            {
                this._treeContainer = new Sprite();
                addChild(this._treeContainer);
            }
            else if (this._treeContainer)
            {
                removeChild(this._treeContainer);
            }
            return;
        }// end function

        public function get treeList() : Boolean
        {
            return this._treeList;
        }// end function

        public function get treeButtonClassName() : String
        {
            return this._treeButtonClassName;
        }// end function

        public function set treeButtonClassName(param1:String)
        {
            if (param1 == "")
            {
                return;
            }
            var _loc_2:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_2 = loaderInfo.applicationDomain;
            }
            var _loc_3:* = _loc_2.getDefinition(param1) as Class;
            if (_loc_3 != null)
            {
                this._treeButtonClassName = param1;
                this._treeButtonClass = _loc_3;
            }
            else
            {
                trace("Error: " + this + ", The class " + param1 + " cannot be found in your library. Please ensure it is there.");
            }
            return;
        }// end function

        public function get treeCheckBoxClassName() : String
        {
            return this._treeCheckBoxClassName;
        }// end function

        public function set treeCheckBoxClassName(param1:String)
        {
            if (param1 == "")
            {
                return;
            }
            var _loc_2:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_2 = loaderInfo.applicationDomain;
            }
            var _loc_3:* = _loc_2.getDefinition(param1) as Class;
            if (_loc_3 != null)
            {
                this._treeCheckBoxClassName = param1;
                this._treeCheckBoxClass = _loc_3;
            }
            else
            {
                trace("Error: " + this + ", The class " + param1 + " cannot be found in your library. Please ensure it is there.");
            }
            return;
        }// end function

        public function get treeButtonGap() : Number
        {
            return this._treeButtonGap;
        }// end function

        public function set treeButtonGap(param1:Number)
        {
            this._treeButtonGap = param1;
            invalidateData();
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

        public function get scrollPosition() : Number
        {
            return this._scrollPosition;
        }// end function

        public function set scrollPosition(param1:Number) : void
        {
            param1 = Math.max(0, Math.min(_dataProvider.length - _totalRenderers, Math.round(param1)));
            if (this._scrollPosition == param1)
            {
                return;
            }
            this._scrollPosition = param1;
            if (this.treeList == true)
            {
                this.refreshData();
                this.updateScrollBar();
            }
            else
            {
                invalidateData();
            }
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
            if (this.ImmediateUpdateSelectIndex == true)
            {
                validateNow();
            }
            return;
        }// end function

        public function set ImmediateUpdateSelectIndex(param1:Boolean) : void
        {
            this._ImmediateUpdateSelectIndex = param1;
            return;
        }// end function

        public function get ImmediateUpdateSelectIndex() : Boolean
        {
            return this._ImmediateUpdateSelectIndex;
        }// end function

        public function get rowCount() : uint
        {
            return _totalRenderers;
        }// end function

        public function set rowCount(param1:uint) : void
        {
            var _loc_2:* = this.rowHeight;
            if (isNaN(this.rowHeight))
            {
                this.calculateRendererTotal(this.availableWidth, this.availableHeight);
            }
            _loc_2 = this.rowHeight;
            height = _loc_2 * param1 + this.margin * 2;
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

        override public function get availableWidth() : Number
        {
            return Math.round(_width) - this.margin * 2 - (this._autoScrollBar ? (Math.round(this._scrollBar.width)) : (0));
        }// end function

        override public function get availableHeight() : Number
        {
            return Math.round(_height) - this.margin * 2;
        }// end function

        override public function scrollToIndex(param1:uint) : void
        {
            if (_totalRenderers == 0)
            {
                return;
            }
            if (param1 >= this._scrollPosition && param1 < this._scrollPosition + _totalRenderers)
            {
                return;
            }
            if (param1 < this._scrollPosition)
            {
                this.scrollPosition = param1;
            }
            else
            {
                this.scrollPosition = param1 - (_totalRenderers - 1);
            }
            return;
        }// end function

        override public function handleInput(event:InputEvent) : void
        {
            if (event.handled)
            {
                return;
            }
            var _loc_2:* = getRendererAt(_selectedIndex, this._scrollPosition);
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
            switch(_loc_3.navEquivalent)
            {
                case NavigationCode.UP:
                {
                    if (selectedIndex == -1)
                    {
                        if (_loc_4)
                        {
                            this.selectedIndex = this.scrollPosition + _totalRenderers - 1;
                        }
                    }
                    else if (_selectedIndex > 0)
                    {
                        if (_loc_4)
                        {
                            var _loc_6:* = selectedIndex - 1;
                            selectedIndex = _loc_6;
                        }
                    }
                    else if (this.wrapping == WrappingMode.STICK)
                    {
                    }
                    else if (this.wrapping == WrappingMode.WRAP)
                    {
                        if (_loc_4)
                        {
                            this.selectedIndex = _dataProvider.length - 1;
                        }
                    }
                    else
                    {
                        return;
                    }
                    break;
                }
                case NavigationCode.DOWN:
                {
                    if (_selectedIndex == -1)
                    {
                        if (_loc_4)
                        {
                            this.selectedIndex = this._scrollPosition;
                        }
                    }
                    else if (_selectedIndex < (_dataProvider.length - 1))
                    {
                        if (_loc_4)
                        {
                            var _loc_6:* = selectedIndex + 1;
                            selectedIndex = _loc_6;
                        }
                    }
                    else if (this.wrapping == WrappingMode.STICK)
                    {
                    }
                    else if (this.wrapping == WrappingMode.WRAP)
                    {
                        if (_loc_4)
                        {
                            this.selectedIndex = 0;
                        }
                    }
                    else
                    {
                        return;
                    }
                    break;
                }
                case NavigationCode.END:
                {
                    if (!_loc_4)
                    {
                        this.selectedIndex = _dataProvider.length - 1;
                    }
                    break;
                }
                case NavigationCode.HOME:
                {
                    if (!_loc_4)
                    {
                        this.selectedIndex = 0;
                    }
                    break;
                }
                case NavigationCode.PAGE_UP:
                {
                    if (_loc_4)
                    {
                        this.selectedIndex = Math.max(0, _selectedIndex - _totalRenderers);
                    }
                    break;
                }
                case NavigationCode.PAGE_DOWN:
                {
                    if (_loc_4)
                    {
                        this.selectedIndex = Math.min((_dataProvider.length - 1), _selectedIndex + _totalRenderers);
                    }
                    break;
                }
                default:
                {
                    return;
                    break;
                }
            }
            event.handled = true;
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK ScrollingList " + name + "]";
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
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (isInvalid(InvalidationType.CHANGEPROVIDER_TERMS))
            {
                this.resetRefresh();
            }
            if (isInvalid(InvalidationType.SCROLL_BAR))
            {
                this.createScrollBar();
            }
            if (isInvalid(InvalidationType.RENDERERS))
            {
                this._autoRowHeight = NaN;
            }
            if (isInvalid(InvalidationType.SELECTED_INDEX))
            {
                this.updateSelectedIndex();
            }
            if (isInvalid(InvalidationType.STATE))
            {
                if (_newFrame)
                {
                    gotoAndPlay(_newFrame);
                    _newFrame = null;
                }
            }
            if (!_usingExternalRenderers && isInvalid(InvalidationType.RENDERERS))
            {
                if (_renderers != null)
                {
                    _loc_2 = _renderers.length;
                    _loc_1 = 0;
                    while (_loc_1 < _loc_2)
                    {
                        
                        _loc_3 = getRendererAt(_loc_1);
                        cleanUpRenderer(_loc_3);
                        _loc_4 = _loc_3 as DisplayObject;
                        if (container.contains(_loc_4))
                        {
                            container.removeChild(_loc_4);
                        }
                        _loc_1 = _loc_1 + 1;
                    }
                }
                _renderers = [];
                invalidateData();
            }
            if (!_usingExternalRenderers && isInvalid(InvalidationType.SIZE))
            {
                removeChild(container);
                setActualSize(_width, _height);
                container.scaleX = 1 / scaleX;
                container.scaleY = 1 / scaleY;
                _totalRenderers = this.calculateRendererTotal(this.availableWidth, this.availableHeight);
                if (this.idUsedByDropDown == true)
                {
                    if (_totalRenderers < (this.availableHeight - this.padding.vertical) / this.rowHeight)
                    {
                        (_totalRenderers + 1);
                    }
                }
                addChild(container);
                invalidateData();
            }
            if (this._treeList == true && this._treeContainer != null)
            {
                removeChild(this._treeContainer);
                addChild(this._treeContainer);
                this._treeContainer.scaleX = 1 / this._treeContainer.parent.scaleX;
                this._treeContainer.scaleY = 1 / this._treeContainer.parent.scaleY;
            }
            if (!_usingExternalRenderers && isInvalid(InvalidationType.RENDERERS, InvalidationType.SIZE))
            {
                this.drawRenderers(_totalRenderers);
                this.drawLayout();
            }
            if (isInvalid(InvalidationType.DATA))
            {
                this.refreshData();
            }
            if (isInvalid(InvalidationType.DATA))
            {
                this.updateScrollBar();
            }
            return;
        }// end function

        override protected function drawLayout() : void
        {
            var _loc_8:* = null;
            var _loc_1:* = _renderers.length;
            var _loc_2:* = this.rowHeight;
            var _loc_3:* = this.availableWidth - this.padding.horizontal;
            var _loc_4:* = this.margin + this.padding.left;
            var _loc_5:* = this.margin + this.padding.top;
            var _loc_6:* = isInvalid(InvalidationType.DATA);
            var _loc_7:* = 0;
            while (_loc_7 < _loc_1)
            {
                
                _loc_8 = getRendererAt(_loc_7);
                _loc_8.x = _loc_4;
                _loc_8.y = _loc_5 + _loc_7 * _loc_2;
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

        override protected function drawRenderers(param1:Number) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = null;
            if (_itemRenderer == null)
            {
                trace("Renderer class not defined.");
                return;
            }
            _loc_2 = _renderers.length;
            while (_loc_2 < _totalRenderers)
            {
                
                _loc_4 = createRenderer(_loc_2);
                if (_loc_4 == null)
                {
                    break;
                }
                _renderers.push(_loc_4);
                container.addChild(_loc_4 as DisplayObject);
                if (this.treeList == true)
                {
                    _loc_6 = null;
                    if (this._treeButtonClass != null)
                    {
                        _loc_7 = new this._treeButtonClass() as Button;
                        _loc_7.toggle = true;
                        _loc_7.focusable = false;
                        _loc_7.preventAutoSize = true;
                        _loc_7.y = _loc_2 * _loc_4.height + Math.floor((_loc_4.height - _loc_7.height) / 2);
                        _loc_6 = new Object();
                        _loc_6.index = _loc_2;
                        _loc_7.data = _loc_6;
                        _loc_7.addEventListener(ButtonEvent.CLICK, this.OnTreeExpandBtnClick, false, 0, true);
                        this._treeButtons.push(_loc_7);
                        this._treeContainer.addChild(_loc_7 as DisplayObject);
                    }
                    if (this._treeCheckBoxClass != null)
                    {
                        _loc_8 = new this._treeCheckBoxClass() as CheckBox;
                        _loc_8.focusable = false;
                        _loc_8.preventAutoSize = true;
                        _loc_8.y = _loc_2 * _loc_4.height + Math.floor((_loc_4.height - _loc_8.height) / 2);
                        _loc_6 = new Object();
                        _loc_6.index = _loc_2;
                        _loc_8.data = _loc_6;
                        _loc_8.addEventListener(ButtonEvent.CLICK, this.OnTreeCheckBoxClick, false, 0, true);
                        this._treeCheckBoxes.push(_loc_8);
                        this._treeContainer.addChild(_loc_8 as DisplayObject);
                    }
                }
                _loc_2++;
            }
            _loc_3 = _renderers.length;
            _loc_2 = _loc_3 - 1;
            while (_loc_2 >= _totalRenderers)
            {
                
                _loc_4 = getRendererAt(_loc_2);
                if (_loc_4 != null)
                {
                    cleanUpRenderer(_loc_4);
                    _loc_5 = _loc_4 as DisplayObject;
                    if (container.contains(_loc_5))
                    {
                        container.removeChild(_loc_5);
                    }
                }
                _renderers.splice(_loc_2, 1);
                _loc_2 = _loc_2 - 1;
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
                this._scrollBar.flash.events:IEventDispatcher::removeEventListener(Event.SCROLL, this.handleScroll, false);
                this._scrollBar.flash.events:IEventDispatcher::removeEventListener(Event.CHANGE, this.handleScroll, false);
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
                        _loc_1.flash.events:IEventDispatcher::addEventListener(MouseEvent.MOUSE_WHEEL, this.blockMouseWheel, false, 0, true);
                        container.addChild(_loc_1 as DisplayObject);
                    }
                }
            }
            else if (this._scrollBarValue is Class)
            {
                _loc_1 = new (this._scrollBarValue as Class)() as IScrollBar;
                _loc_1.flash.events:IEventDispatcher::addEventListener(MouseEvent.MOUSE_WHEEL, this.blockMouseWheel, false, 0, true);
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
            invalidateSize();
            if (this._scrollBar == null)
            {
                return;
            }
            this._scrollBar.flash.events:IEventDispatcher::addEventListener(Event.SCROLL, this.handleScroll, false, 0, true);
            this._scrollBar.flash.events:IEventDispatcher::addEventListener(Event.CHANGE, this.handleScroll, false, 0, true);
            this._scrollBar.focusTarget = this;
            this._scrollBar.tabEnabled = false;
            return;
        }// end function

        protected function drawScrollBar() : void
        {
            if (!this._autoScrollBar)
            {
                return;
            }
            this._scrollBar.x = _width - this._scrollBar.width - this.margin;
            this._scrollBar.y = this.margin;
            this._scrollBar.height = this.availableHeight;
            this._scrollBar.validateNow();
            return;
        }// end function

        protected function updateScrollBar() : void
        {
            var _loc_2:* = null;
            if (this._scrollBar == null)
            {
                return;
            }
            var _loc_1:* = Math.max(0, _dataProvider.length - _totalRenderers);
            if (this._scrollBar is ScrollIndicator)
            {
                _loc_2 = this._scrollBar as ScrollIndicator;
                _loc_2.setScrollProperties(_dataProvider.length - _totalRenderers, 0, _dataProvider.length - _totalRenderers);
            }
            this._scrollBar.position = this._scrollPosition;
            this._scrollBar.validateNow();
            return;
        }// end function

        override protected function changeFocus() : void
        {
            super.changeFocus();
            var _loc_1:* = getRendererAt(_selectedIndex, this._scrollPosition);
            if (_loc_1 != null)
            {
                _loc_1.displayFocus = focused > 0;
                _loc_1.validateNow();
            }
            return;
        }// end function

        override protected function refreshData() : void
        {
            this._scrollPosition = Math.min(Math.max(0, _dataProvider.length - _totalRenderers), this._scrollPosition);
            this.selectedIndex = Math.min((_dataProvider.length - 1), _selectedIndex);
            this.updateSelectedIndex(true);
            _dataProvider.requestItemRange(this._scrollPosition, Math.min((_dataProvider.length - 1), this._scrollPosition + _totalRenderers - 1), this.populateData);
            return;
        }// end function

        public function resetRefresh() : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            if (_renderers == null || this.treeList == false)
            {
                return;
            }
            var _loc_1:* = new Array();
            _loc_2 = 0;
            while (_loc_2 < dataProvider.length)
            {
                
                if (dataProvider[_loc_2].depth == 0)
                {
                    _loc_1.push(dataProvider[_loc_2]);
                }
                _loc_2 = _loc_2 + 1;
            }
            var _loc_4:* = new Array();
            _loc_2 = 0;
            while (_loc_2 < _loc_1.length)
            {
                
                _loc_4.push(_loc_1[_loc_2]);
                if (_loc_1[_loc_2].expanded && _loc_1[_loc_2].leaf != null)
                {
                    _loc_3 = 0;
                    while (_loc_3 < _loc_1[_loc_2].leaf.length)
                    {
                        
                        _loc_4.push(_loc_1[_loc_2].leaf[_loc_3]);
                        _loc_3 = _loc_3 + 1;
                    }
                }
                _loc_2 = _loc_2 + 1;
            }
            this.dataProvider = new DataProvider(_loc_4);
            return;
        }// end function

        override public function refreshTreeData() : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = NaN;
            var _loc_8:* = undefined;
            this._scrollPosition = Math.min(Math.max(0, _dataProvider.length - _totalRenderers), this._scrollPosition);
            this.selectedIndex = Math.min((_dataProvider.length - 1), _selectedIndex);
            var _loc_1:* = _dataProvider.requestItemRange(this._scrollPosition, Math.min((_dataProvider.length - 1), this._scrollPosition + _totalRenderers - 1));
            var _loc_2:* = _renderers.length;
            var _loc_3:* = 0;
            while (_loc_3 < _loc_2)
            {
                
                _loc_4 = getRendererAt(_loc_3);
                _loc_5 = this._treeButtons[_loc_3];
                _loc_6 = this._treeCheckBoxes[_loc_3];
                _loc_7 = this._treeButtonGap;
                if (_loc_7 == -1)
                {
                    if (_loc_5 != null)
                    {
                        _loc_7 = _loc_5.width;
                    }
                    else if (_loc_5 == null && _loc_6 != null)
                    {
                        _loc_7 = _loc_6.width;
                    }
                    else
                    {
                        _loc_7 = 0;
                    }
                }
                if (this.treeList == true && _loc_4.enabled == true)
                {
                    if (_loc_1[_loc_3] != null)
                    {
                        _loc_8 = _loc_1[_loc_3].leaf;
                        if (undefined == _loc_8 || _loc_8 == 0 || _loc_8.length == 0)
                        {
                            if (_loc_1[_loc_3].likeFolder == false)
                            {
                                if (_loc_5 != null)
                                {
                                    _loc_5.visible = false;
                                }
                                if (_loc_6 != null)
                                {
                                    _loc_6.visible = true;
                                    _loc_6.selected = _loc_4.checked;
                                }
                            }
                            else
                            {
                                if (_loc_5 != null)
                                {
                                    _loc_5.visible = true;
                                    _loc_5.selected = false;
                                }
                                if (_loc_6 != null)
                                {
                                    _loc_6.visible = false;
                                }
                            }
                        }
                        else
                        {
                            if (_loc_5 != null)
                            {
                                _loc_5.visible = true;
                                _loc_5.selected = _loc_4.expanded;
                            }
                            if (_loc_6 != null)
                            {
                                _loc_6.visible = false;
                            }
                        }
                        if (_loc_6 != null && _loc_6.visible == true)
                        {
                            if (_loc_5 != null && _loc_6 == null)
                            {
                                _loc_5.x = _loc_7 * _loc_1[_loc_3].depth;
                                _loc_4.setLabelOffsetX(_loc_5.x + _loc_5.width);
                            }
                            else if (_loc_5 == null && _loc_6 != null)
                            {
                                _loc_6.x = _loc_7 * _loc_1[_loc_3].depth;
                                _loc_4.setLabelOffsetX(_loc_6.x + _loc_6.width);
                            }
                            else if (_loc_5 != null && _loc_6 != null)
                            {
                                if (_loc_5.visible == false)
                                {
                                    _loc_6.x = _loc_7 * _loc_1[_loc_3].depth;
                                }
                                else
                                {
                                    _loc_5.x = _loc_7 * _loc_1[_loc_3].depth;
                                    _loc_6.x = _loc_5.x + _loc_5.width;
                                }
                                _loc_4.setLabelOffsetX(_loc_6.x + _loc_6.width);
                            }
                            else
                            {
                                _loc_4.setLabelOffsetX(_loc_1[_loc_3].depth * _loc_7);
                            }
                        }
                        else if (_loc_5 != null)
                        {
                            _loc_5.x = _loc_7 * _loc_1[_loc_3].depth;
                            _loc_4.setLabelOffsetX(_loc_5.x + _loc_5.width);
                        }
                        else
                        {
                            _loc_4.setLabelOffsetX(_loc_1[_loc_3].depth * _loc_7);
                        }
                    }
                }
                else
                {
                    if (_loc_5 != null)
                    {
                        _loc_5.visible = false;
                    }
                    if (_loc_6 != null)
                    {
                        _loc_6.visible = false;
                    }
                }
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        override protected function updateSelectedIndex(param1:Boolean = false) : void
        {
            if (_totalRenderers == 0)
            {
                return;
            }
            var _loc_2:* = getRendererAt(_selectedIndex, this.scrollPosition);
            if (multiSelect == false)
            {
                if (_selectedIndex == _newSelectedIndex)
                {
                    return;
                }
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
                _loc_2 = getRendererAt(_selectedIndex, this._scrollPosition);
                if (_loc_2 != null)
                {
                    _loc_2.selected = true;
                    _loc_2.validateNow();
                }
                else
                {
                    this.scrollToIndex(_selectedIndex);
                    _loc_2 = getRendererAt(_selectedIndex, this.scrollPosition);
                    _loc_2.selected = true;
                    _loc_2.validateNow();
                }
            }
            else
            {
                if (param1 == true)
                {
                    return;
                }
                super.selectedIndex = _newSelectedIndex;
                if (_selectedIndex < 0 || _selectedIndex >= _dataProvider.length)
                {
                    return;
                }
                if (undefined == _dataProvider[super.selectedIndex].multiSelected)
                {
                    _dataProvider[super.selectedIndex].multiSelected = false;
                }
                _loc_2 = getRendererAt(_selectedIndex, this._scrollPosition);
                if (_loc_2 != null)
                {
                    _dataProvider[super.selectedIndex].multiSelected = !_dataProvider[super.selectedIndex].multiSelected;
                    _loc_2.validateNow();
                    _loc_2.selected = _dataProvider[super.selectedIndex].multiSelected;
                }
                else
                {
                    this.scrollToIndex(_selectedIndex);
                    _loc_2 = getRendererAt(_selectedIndex, this.scrollPosition);
                    _dataProvider[super.selectedIndex].multiSelected = !_dataProvider[super.selectedIndex].multiSelected;
                    _loc_2.validateNow();
                    _loc_2.selected = _dataProvider[super.selectedIndex].multiSelected;
                }
            }
            return;
        }// end function

        override protected function calculateRendererTotal(param1:Number, param2:Number) : uint
        {
            var _loc_3:* = null;
            if (isNaN(this._rowHeight) && isNaN(this._autoRowHeight))
            {
                _loc_3 = createRenderer(0);
                this._autoRowHeight = _loc_3.height;
                cleanUpRenderer(_loc_3);
            }
            return (this.availableHeight - this.padding.vertical) / this.rowHeight >> 0;
        }// end function

        protected function handleScroll(event:Event) : void
        {
            var _loc_2:* = this._scrollBar.position - this.scrollPosition;
            this.scrollPosition = this._scrollBar.position;
            dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, false, true, _loc_2));
            return;
        }// end function

        protected function populateData(param1:Array) : void
        {
            var _loc_5:* = null;
            var _loc_6:* = 0;
            var _loc_7:* = null;
            var _loc_8:* = false;
            if (_renderers == null)
            {
                return;
            }
            var _loc_2:* = param1.length;
            var _loc_3:* = _renderers.length;
            var _loc_4:* = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = getRendererAt(_loc_4);
                _loc_6 = this._scrollPosition + _loc_4;
                _loc_7 = null;
                if (multiSelect == false)
                {
                    _loc_7 = new ListData(_loc_6, itemToLabel(param1[_loc_4]), _selectedIndex == _loc_6);
                }
                else if (param1.length != 0)
                {
                    _loc_8 = false;
                    if (_loc_4 < param1.length)
                    {
                        if (undefined != param1[_loc_4].multiSelected)
                        {
                            _loc_8 = param1[_loc_4].multiSelected;
                        }
                    }
                    _loc_7 = new ListData(_loc_6, itemToLabel(param1[_loc_4]), _loc_8);
                }
                else
                {
                    _loc_7 = new ListData(_loc_6, itemToLabel(param1[_loc_4]), _selectedIndex == _loc_6);
                }
                _loc_5.enabled = _loc_4 >= _loc_2 ? (false) : (true);
                _loc_5.setListData(_loc_7);
                _loc_5.setData(param1[_loc_4]);
                _loc_5.validateNow();
                this.refreshTreeData();
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        protected function TreeExpand(param1:Array) : Array
        {
            var _loc_4:* = undefined;
            var _loc_5:* = null;
            var _loc_6:* = 0;
            var _loc_2:* = [];
            var _loc_3:* = 0;
            while (_loc_3 < param1.length)
            {
                
                _loc_2.push(param1[_loc_3]);
                _loc_4 = param1[_loc_3].leaf;
                if (param1[_loc_3].expanded == true && undefined != _loc_4 && _loc_4 != 0 && _loc_4.length != 0)
                {
                    _loc_5 = this.TreeExpand(param1[_loc_3].leaf);
                    _loc_6 = 0;
                    while (_loc_6 < _loc_5.length)
                    {
                        
                        _loc_2.push(_loc_5[_loc_6]);
                        _loc_6++;
                    }
                }
                _loc_3++;
            }
            return _loc_2;
        }// end function

        protected function TreeFoldCount(param1:Array) : int
        {
            var _loc_4:* = undefined;
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            while (_loc_3 < param1.length)
            {
                
                _loc_2 = _loc_2 + 1;
                _loc_4 = param1[_loc_3].leaf;
                if (param1[_loc_3].expanded == true && undefined != _loc_4 && _loc_4 != 0 && _loc_4.length != 0)
                {
                    _loc_2 = _loc_2 + this.TreeFoldCount(param1[_loc_3].leaf);
                }
                _loc_3++;
            }
            return _loc_2;
        }// end function

        protected function TreeExpandFunc(param1:Number) : void
        {
            var _loc_10:* = 0;
            if (_renderers == null)
            {
                invalidate(InvalidationType.RENDERERS);
                validateNow();
                if (_renderers == null)
                {
                    return;
                }
            }
            var _loc_2:* = _renderers[param1 - this._scrollPosition];
            var _loc_3:* = _loc_2.getLeafDataProvider();
            if (_loc_3 == null)
            {
                return;
            }
            dataProvider[param1].expanded = !dataProvider[param1].expanded;
            var _loc_4:* = 0;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = true;
            var _loc_9:* = null;
            if (dataProvider[param1].expanded == true)
            {
                _loc_5 = dataProvider.requestItemRange(0, param1);
                _loc_6 = this.TreeExpand(_loc_3.requestItemRange(0, _loc_3.length));
                _loc_7 = dataProvider.requestItemRange((param1 + 1), dataProvider.length);
                _loc_9 = _loc_5;
                _loc_4 = 0;
                while (_loc_4 < _loc_6.length)
                {
                    
                    _loc_9.push(_loc_6[_loc_4]);
                    _loc_4++;
                }
                _loc_4 = 0;
                while (_loc_4 < _loc_7.length)
                {
                    
                    _loc_9.push(_loc_7[_loc_4]);
                    _loc_4++;
                }
                _loc_8 = true;
            }
            else
            {
                _loc_10 = this.TreeFoldCount(_loc_3.requestItemRange(0, _loc_3.length));
                _loc_5 = dataProvider.requestItemRange(0, param1);
                _loc_7 = dataProvider.requestItemRange((param1 + 1) + _loc_10, dataProvider.length);
                _loc_9 = _loc_5;
                _loc_4 = 0;
                while (_loc_4 < _loc_7.length)
                {
                    
                    _loc_9.push(_loc_7[_loc_4]);
                    _loc_4++;
                }
                _loc_8 = false;
            }
            if (_loc_9 != null)
            {
                this.dataProvider = new DataProvider(_loc_9);
            }
            this.selectedIndex = -1;
            if (_loc_8 == true)
            {
                dispatchEvent(new TreeEvent(TreeEvent.ITEM_EXPAND, param1));
            }
            else
            {
                dispatchEvent(new TreeEvent(TreeEvent.ITEM_COLLAPSE, param1));
            }
            return;
        }// end function

        override protected function handleItemClick(event:ButtonEvent) : void
        {
            var _loc_2:* = (event.currentTarget as IListItemRenderer).index;
            if (isNaN(_loc_2))
            {
                return;
            }
            if (dispatchItemEvent(event))
            {
                this.selectedIndex = _loc_2;
                if (this.treeList == true && this.itemClickExpand == true)
                {
                    this.TreeExpandFunc(_loc_2);
                }
            }
            return;
        }// end function

        protected function OnTreeExpandBtnClick(event:ButtonEvent) : void
        {
            var _loc_2:* = event.currentTarget as Button;
            var _loc_3:* = this.scrollPosition + _loc_2.data.index;
            var _loc_4:* = new ListEvent(ListEvent.ITEM_CLICK, false, true, _loc_3, 0, _loc_3);
            dispatchEvent(_loc_4);
            this.TreeExpandFunc(_loc_3);
            return;
        }// end function

        protected function OnTreeCheckBoxClick(event:ButtonEvent) : void
        {
            var _loc_2:* = event.currentTarget as CheckBox;
            dataProvider[this.scrollPosition + _loc_2.data.index].checked = _loc_2.selected;
            dispatchEvent(new TreeEvent(TreeEvent.ITEM_CHECK, _loc_2.data.index));
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

        public function DoExpand(param1:int, param2) : void
        {
            if (this.treeList == false)
            {
                return;
            }
            if (param2 == "false" || param2 == "0")
            {
                param2 = false;
            }
            else
            {
                param2 = true;
            }
            if (param1 < 0 || dataProvider.length <= param1)
            {
                return;
            }
            if (dataProvider[param1].expanded == param2)
            {
                return;
            }
            this.TreeExpandFunc(param1);
            return;
        }// end function

        public function DoCheck(param1:int, param2) : void
        {
            var _loc_4:* = null;
            if (this.treeList == false)
            {
                return;
            }
            if (param2 == "false" || param2 == "0")
            {
                param2 = false;
            }
            else
            {
                param2 = true;
            }
            if (param1 < 0 || dataProvider.length <= param1)
            {
                return;
            }
            if (dataProvider[param1].checked == param2)
            {
                return;
            }
            dataProvider[param1].checked = param2;
            var _loc_3:* = param1 - this.scrollPosition;
            if (_loc_3 >= 0 && _loc_3 < this._treeCheckBoxes.length)
            {
                _loc_4 = this._treeCheckBoxes[_loc_3];
                _loc_4.selected = param2;
            }
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
