package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.gfx.*;

    public class CoreList extends UIComponent
    {
        protected var _selectedIndex:int = -1;
        protected var _newSelectedIndex:int = -1;
        protected var _dataProvider:IDataProvider;
        protected var _labelField:String = "label";
        protected var _labelFunction:Function;
        protected var _itemRenderer:Class;
        protected var _itemRendererName:String = "DefaultListItemRenderer";
        protected var _renderers:Array;
        protected var _usingExternalRenderers:Boolean = false;
        protected var _totalRenderers:uint = 0;
        protected var _state:String = "default";
        protected var _newFrame:String;
        public var container:Sprite;
        protected var _multiSelect:Boolean = false;

        public function CoreList()
        {
            return;
        }// end function

        override protected function initialize() : void
        {
            this.dataProvider = new DataProvider();
            super.initialize();
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

        public function get itemRendererName() : String
        {
            return this._itemRendererName;
        }// end function

        public function set itemRendererName(param1:String) : void
        {
            if (_inspector && param1 == "" || param1 == "")
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
                this.itemRenderer = _loc_3;
            }
            else
            {
                trace("Error: " + this + ", The class " + param1 + " cannot be found in your library. Please ensure it is there.");
            }
            return;
        }// end function

        public function get multiSelect() : Boolean
        {
            return this._multiSelect;
        }// end function

        public function set multiSelect(param1:Boolean) : void
        {
            this._multiSelect = param1;
            return;
        }// end function

        public function get itemRenderer() : Class
        {
            return this._itemRenderer;
        }// end function

        public function set itemRenderer(param1:Class) : void
        {
            this._itemRenderer = param1;
            this.invalidateRenderers();
            return;
        }// end function

        public function set itemRendererInstanceName(param1:String) : void
        {
            var _loc_4:* = null;
            if (param1 == null || param1 == "" || parent == null)
            {
                return;
            }
            var _loc_2:* = 0;
            var _loc_3:* = new Array();
            while (++_loc_2)
            {
                
                _loc_4 = parent.getChildByName(param1 + _loc_2) as IListItemRenderer;
                if (_loc_4 == null)
                {
                    if (_loc_2 == 0)
                    {
                        continue;
                    }
                    break;
                }
                _loc_3.push(_loc_4);
            }
            if (_loc_3.length == 0)
            {
                if (componentInspectorSetting)
                {
                    return;
                }
                _loc_3 = null;
            }
            this.itemRendererList = _loc_3;
            return;
        }// end function

        public function set itemRendererList(param1:Array) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            if (this._usingExternalRenderers)
            {
                _loc_2 = this._renderers.length;
                _loc_3 = 0;
                while (_loc_3 < _loc_2)
                {
                    
                    this.cleanUpRenderer(this.getRendererAt(_loc_3));
                    _loc_3 = _loc_3 + 1;
                }
            }
            this._usingExternalRenderers = param1 != null;
            if (this._renderers == null)
            {
                this._renderers = new Array();
            }
            _loc_3 = 0;
            while (_loc_3 < param1.length)
            {
                
                this._renderers.push(param1[_loc_3]);
                _loc_3 = _loc_3 + 1;
            }
            if (this._usingExternalRenderers)
            {
                _loc_2 = this._renderers.length;
                _loc_3 = 0;
                while (_loc_3 < _loc_2)
                {
                    
                    this.setupRenderer(this.getRendererAt(_loc_3));
                    _loc_3 = _loc_3 + 1;
                }
                this._totalRenderers = this._renderers.length;
            }
            this.invalidateRenderers();
            return;
        }// end function

        public function get selectedIndex() : int
        {
            return this._selectedIndex;
        }// end function

        public function set selectedIndex(param1:int) : void
        {
            if (this._selectedIndex == param1)
            {
                return;
            }
            this._selectedIndex = param1;
            this.invalidateSelectedIndex();
            dispatchEventAndSound(new ListEvent(ListEvent.INDEX_CHANGE, true, false, this._selectedIndex, -1, -1, this.getRendererAt(this._selectedIndex), this.dataProvider[this._selectedIndex]));
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            var _loc_4:* = null;
            super.enabled = param1;
            this.setState(super.enabled ? ("default") : ("disabled"));
            if (this._renderers != null)
            {
                _loc_2 = this._renderers.length;
                _loc_3 = 0;
                while (_loc_3 < _loc_2)
                {
                    
                    _loc_4 = this.getRendererAt(_loc_3);
                    _loc_4.enabled = this.enabled;
                    _loc_3 = _loc_3 + 1;
                }
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

        public function get availableWidth() : Number
        {
            return _width;
        }// end function

        public function get availableHeight() : Number
        {
            return _height;
        }// end function

        public function scrollToIndex(param1:uint) : void
        {
            return;
        }// end function

        public function scrollToSelected() : void
        {
            this.scrollToIndex(this._selectedIndex);
            return;
        }// end function

        public function itemToLabel(param1:Object) : Array
        {
            if (param1 == null)
            {
                return [""];
            }
            if (this._labelFunction != null)
            {
                return this._labelFunction(param1);
            }
            if (this._labelField != null && this._labelField in param1 && param1[this._labelField] != null)
            {
                return [param1[this._labelField]];
            }
            return [param1.toString()];
        }// end function

        public function getRendererAt(param1:uint, param2:int = 0) : IListItemRenderer
        {
            if (this._renderers == null)
            {
                return null;
            }
            var _loc_3:* = param1 - param2;
            if (_loc_3 >= this._renderers.length)
            {
                return null;
            }
            return this._renderers[_loc_3] as IListItemRenderer;
        }// end function

        public function invalidateRenderers() : void
        {
            invalidate(InvalidationType.RENDERERS);
            return;
        }// end function

        public function invalidateSelectedIndex() : void
        {
            invalidate(InvalidationType.SELECTED_INDEX);
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK CoreList " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            if (this.container == null)
            {
                this.container = new Sprite();
                addChild(this.container);
            }
            tabEnabled = _focusable && this.enabled;
            tabChildren = false;
            addEventListener(MouseEvent.MOUSE_WHEEL, this.handleMouseWheel, false, 0, true);
            return;
        }// end function

        override protected function draw() : void
        {
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (isInvalid(InvalidationType.SELECTED_INDEX))
            {
                this.updateSelectedIndex();
            }
            if (isInvalid(InvalidationType.STATE))
            {
                if (this._newFrame)
                {
                    gotoAndPlay(this._newFrame);
                    this._newFrame = null;
                }
            }
            if (!this._usingExternalRenderers && isInvalid(InvalidationType.RENDERERS))
            {
                if (this._renderers != null)
                {
                    _loc_2 = this._renderers.length;
                    _loc_1 = 0;
                    while (_loc_1 < _loc_2)
                    {
                        
                        _loc_3 = this.getRendererAt(_loc_1);
                        this.cleanUpRenderer(_loc_3);
                        _loc_4 = _loc_3 as DisplayObject;
                        if (this.container.contains(_loc_4))
                        {
                            this.container.removeChild(_loc_4);
                        }
                        _loc_1 = _loc_1 + 1;
                    }
                }
                this._renderers = [];
                invalidateData();
            }
            if (!this._usingExternalRenderers && isInvalid(InvalidationType.SIZE))
            {
                removeChild(this.container);
                setActualSize(_width, _height);
                this.container.scaleX = 1 / scaleX;
                this.container.scaleY = 1 / scaleY;
                this._totalRenderers = this.calculateRendererTotal(this.availableWidth, this.availableHeight);
                addChild(this.container);
                invalidateData();
            }
            if (!this._usingExternalRenderers && isInvalid(InvalidationType.RENDERERS, InvalidationType.SIZE))
            {
                this.drawRenderers(this._totalRenderers);
                this.drawLayout();
            }
            if (isInvalid(InvalidationType.DATA))
            {
                this.refreshData();
            }
            return;
        }// end function

        override protected function changeFocus() : void
        {
            if (_focused || _displayFocus)
            {
                this.setState("focused", "default");
            }
            else
            {
                this.setState("default");
            }
            return;
        }// end function

        protected function refreshData() : void
        {
            return;
        }// end function

        protected function updateSelectedIndex(param1:Boolean = false) : void
        {
            return;
        }// end function

        protected function calculateRendererTotal(param1:Number, param2:Number) : uint
        {
            return param2 / 20 >> 0;
        }// end function

        protected function drawLayout() : void
        {
            return;
        }// end function

        protected function drawRenderers(param1:Number) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (this._itemRenderer == null)
            {
                trace("Renderer class not defined.");
                return;
            }
            _loc_2 = this._renderers.length;
            while (_loc_2 < this._totalRenderers)
            {
                
                _loc_4 = this.createRenderer(_loc_2);
                if (_loc_4 == null)
                {
                    break;
                }
                this._renderers.push(_loc_4);
                this.container.addChild(_loc_4 as DisplayObject);
                _loc_2++;
            }
            _loc_3 = this._renderers.length;
            _loc_2 = _loc_3 - 1;
            while (_loc_2 >= this._totalRenderers)
            {
                
                _loc_4 = this.getRendererAt(_loc_2);
                if (_loc_4 != null)
                {
                    this.cleanUpRenderer(_loc_4);
                    _loc_5 = _loc_4 as DisplayObject;
                    if (this.container.contains(_loc_5))
                    {
                        this.container.removeChild(_loc_5);
                    }
                }
                this._renderers.splice(_loc_2, 1);
                _loc_2 = _loc_2 - 1;
            }
            return;
        }// end function

        protected function createRenderer(param1:uint) : IListItemRenderer
        {
            var _loc_2:* = new this._itemRenderer() as IListItemRenderer;
            if (_loc_2 == null)
            {
                trace("Renderer class could not be created.");
                return null;
            }
            this.setupRenderer(_loc_2);
            return _loc_2;
        }// end function

        protected function setupRenderer(param1:IListItemRenderer) : void
        {
            var _loc_2:* = null;
            param1.owner = this;
            param1.focusTarget = this;
            param1.tabEnabled = false;
            param1.doubleClickEnabled = true;
            if (this.multiSelect == true)
            {
                _loc_2 = param1 as Button;
                _loc_2.toggle = true;
            }
            param1["parentX"] = this.x;
            param1["parentY"] = this.y;
            param1.flash.events:IEventDispatcher::addEventListener(ButtonEvent.PRESS, this.dispatchItemEvent, false, 0, true);
            param1.flash.events:IEventDispatcher::addEventListener(ButtonEvent.CLICK, this.handleItemClick, false, 0, true);
            param1.flash.events:IEventDispatcher::addEventListener(MouseEvent.MOUSE_UP, this.dispatchItemEvent, false, 0, true);
            param1.flash.events:IEventDispatcher::addEventListener(MouseEvent.DOUBLE_CLICK, this.dispatchItemEvent, false, 0, true);
            param1.flash.events:IEventDispatcher::addEventListener(MouseEvent.ROLL_OVER, this.dispatchItemEvent, false, 0, true);
            param1.flash.events:IEventDispatcher::addEventListener(MouseEvent.ROLL_OUT, this.dispatchItemEvent, false, 0, true);
            if (this._usingExternalRenderers)
            {
                param1.flash.events:IEventDispatcher::addEventListener(MouseEvent.MOUSE_WHEEL, this.handleMouseWheel, false, 0, true);
            }
            return;
        }// end function

        protected function cleanUpRenderer(param1:IListItemRenderer) : void
        {
            param1.owner = null;
            param1.focusTarget = null;
            param1.doubleClickEnabled = false;
            param1.flash.events:IEventDispatcher::removeEventListener(ButtonEvent.PRESS, this.dispatchItemEvent);
            param1.flash.events:IEventDispatcher::removeEventListener(ButtonEvent.CLICK, this.handleItemClick);
            param1.flash.events:IEventDispatcher::removeEventListener(MouseEvent.MOUSE_UP, this.dispatchItemEvent);
            param1.flash.events:IEventDispatcher::removeEventListener(MouseEvent.DOUBLE_CLICK, this.dispatchItemEvent);
            param1.flash.events:IEventDispatcher::removeEventListener(MouseEvent.ROLL_OVER, this.dispatchItemEvent);
            param1.flash.events:IEventDispatcher::removeEventListener(MouseEvent.ROLL_OUT, this.dispatchItemEvent);
            param1.flash.events:IEventDispatcher::removeEventListener(MouseEvent.MOUSE_WHEEL, this.handleMouseWheel);
            return;
        }// end function

        protected function dispatchItemEvent(event:Event) : Boolean
        {
            var _loc_2:* = null;
            switch(event.type)
            {
                case ButtonEvent.PRESS:
                {
                    _loc_2 = ListEvent.ITEM_PRESS;
                    break;
                }
                case ButtonEvent.CLICK:
                {
                    _loc_2 = ListEvent.ITEM_CLICK;
                    this.invalidateSelectedIndex();
                    break;
                }
                case MouseEvent.MOUSE_UP:
                {
                    _loc_2 = ListEvent.ITEM_UP;
                    break;
                }
                case MouseEvent.ROLL_OVER:
                {
                    _loc_2 = ListEvent.ITEM_ROLL_OVER;
                    break;
                }
                case MouseEvent.ROLL_OUT:
                {
                    _loc_2 = ListEvent.ITEM_ROLL_OUT;
                    break;
                }
                case MouseEvent.DOUBLE_CLICK:
                {
                    _loc_2 = ListEvent.ITEM_DOUBLE_CLICK;
                    break;
                }
                default:
                {
                    return true;
                    break;
                }
            }
            var _loc_3:* = event.currentTarget as IListItemRenderer;
            var _loc_4:* = 0;
            if (event is ButtonEvent)
            {
                _loc_4 = (event as ButtonEvent).controllerIdx;
            }
            else if (event is MouseEventEx)
            {
                _loc_4 = (event as MouseEventEx).mouseIdx;
            }
            var _loc_5:* = 0;
            if (event is ButtonEvent)
            {
                _loc_5 = (event as ButtonEvent).buttonIdx;
            }
            else if (event is MouseEventEx)
            {
                _loc_5 = (event as MouseEventEx).buttonIdx;
            }
            var _loc_6:* = false;
            if (event is ButtonEvent)
            {
                _loc_6 = (event as ButtonEvent).isKeyboard;
            }
            var _loc_7:* = new ListEvent(_loc_2, false, true, _loc_3.index, 0, _loc_3.index, _loc_3, this.dataProvider[_loc_3.index], _loc_4, _loc_5, _loc_6);
            return dispatchEventAndSound(_loc_7);
        }// end function

        protected function handleDataChange(event:Event) : void
        {
            invalidate(InvalidationType.DATA);
            return;
        }// end function

        protected function handleItemClick(event:ButtonEvent) : void
        {
            var _loc_2:* = (event.currentTarget as IListItemRenderer).index;
            if (isNaN(_loc_2))
            {
                return;
            }
            if (this.dispatchItemEvent(event))
            {
                this.selectedIndex = _loc_2;
            }
            return;
        }// end function

        protected function handleMouseWheel(event:MouseEvent) : void
        {
            this.scrollList(event.delta > 0 ? (1) : (-1));
            return;
        }// end function

        protected function scrollList(param1:int) : void
        {
            return;
        }// end function

        protected function setState(... args) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (args.length == 1)
            {
                _loc_4 = args[0].toString();
                if (this._state != _loc_4 && _labelHash[_loc_4])
                {
                    var _loc_6:* = _loc_4;
                    this._newFrame = _loc_4;
                    this._state = _loc_6;
                    invalidateState();
                }
                return;
            }
            args = args.length;
            var _loc_3:* = 0;
            while (_loc_3 < args)
            {
                
                _loc_5 = args[_loc_3].toString();
                if (_labelHash[_loc_5])
                {
                    var _loc_6:* = _loc_5;
                    this._newFrame = _loc_5;
                    this._state = _loc_6;
                    invalidateState();
                    break;
                }
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        public function refreshTreeData() : void
        {
            return;
        }// end function

    }
}
