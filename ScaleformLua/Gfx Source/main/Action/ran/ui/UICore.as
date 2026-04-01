package ran.ui
{
    import fl.transitions.easing.*;
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;
    import flash.utils.*;
    import ran.ui.*;
    import ran.ui.core.*;
    import ran.ui.data.*;
    import ran.ui.events.*;
    import ran.ui.managers.*;
    import ran.ui.slot.*;
    import ran.ui.utils.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.managers.*;
    import scaleform.clik.motion.*;
    import scaleform.gfx.*;

    public class UICore extends MovieClip implements IUICoreInterface
    {
        private var LoadedWidget:Dictionary;
        private var LoadedMultiWidget:Dictionary;
        private var LoadingWidget:Array;
        private var LoadingMultiWidget:Array;
        private var InstCache:Dictionary;
        private var isProcessingUnloadAll:Boolean = false;
        public var displayMan:MDisplayMan;
        private var snappingWidget:Dictionary;
        private var mcFakeModal:MovieClip;
        private var _focusWindow:MWindow = null;
        public var mcTooltip:MSimpleTooltip;
        private const snapPixel:int = 10;
        private static const DisplayMan_FileName:String = "DisplayManager.swf";
        private static const Core_OpenWidget:int = 0;
        private static const Core_CloseWidget:int = 1;
        private static const Core_CloseAllWidget:int = 2;
        private static const Core_UnloadWidget:int = 3;
        private static const Core_IsOpenWidget:int = 4;
        private static const Core_IsLoadWidget:int = 5;
        private static const Core_GetMultiWidgetCount:int = 6;
        private static const Core_EscWidgetClose:int = 7;
        private static const Core_SetStageEvent:int = 8;
        private static const Core_SetProperty:int = 9;
        private static const Core_GetProperty:int = 10;
        private static const Core_SetEvent:int = 11;
        private static const Core_SetDataProvider:int = 12;
        private static const Core_RemoveDataProvider:int = 13;
        private static const Core_GetDataProvider:int = 14;
        private static const Core_SetDataProviderProp:int = 15;
        private static const Core_SetListItemPropArray:int = 16;
        private static const Core_SetListItemProp:int = 17;
        private static const Core_SetListItemFunc:int = 18;
        private static const Core_CallFunction:int = 19;
        private static const Core_SetFocus:int = 20;
        private static const Core_SetTextFormat:int = 21;
        private static const Core_SetTween:int = 22;
        private static const Core_HitTestEnable:int = 23;
        private static const Core_GetSlotTooltipPosSize:int = 24;
        private static const Core_SlotDragStop:int = 25;
        private static const Core_GetDragSlotBinding:int = 26;
        private static const Core_GetWidgetInstance:int = 27;
        private static const Core_ResetWidgetPosition:int = 28;
        private static const Core_IsOpenTooltip:int = 29;
        private static const Core_GetDataProviderArray:int = 30;
        private static const Core_SetSpeechBubble:int = 31;
        private static const Core_DelSpeechBubble:int = 32;
        private static const Core_SetFakeModal:int = 33;
        private static const Core_SetDataProvider_Terms:int = 34;
        private static const Core_SnapCheck:int = 35;
        private static const Core_SetUIAlpha:int = 36;
        private static const Core_GC:int = 37;
        private static const Core_RemoveTween:int = 38;
        private static const Core_RegShowTooltipEnableState:int = 39;
        private static const Core_UnregShowTooltipEnableStatep:int = 40;
        private static const Core_UpdateDraggingSlot:int = 41;
        private static const Core_SetFoward:int = 42;
        private static const Core_SetHeadData:int = 43;
        private static const Core_SetTreeData:int = 44;
        private static const Core_GetHeadData:int = 45;
        private static const Core_GetTreeData:int = 46;
        private static const Core_ChangeHeadData:int = 47;
        private static const Core_ChangeTreeData:int = 48;
        private static const Core_CloseTooltipForce:int = 49;
        private static const Core_ReleaseGhostIcon:int = 50;
        private static const Core_CallFunctionObject:int = 51;
        private static const Core_HitTest:int = 52;
        public static var arrUIList:Dictionary;
        public static var arrEscList:Array;
        public static var canvasWidget_b:MovieClip;
        public static var canvasWidget_m:MovieClip;
        public static var canvasWidget_t:MovieClip;
        public static var arrOpenLaterCall:Array;
        public static var instance:UICore = null;

        public function UICore() : void
        {
            Aligner._stage = stage;
            Aligner._PrevStageWidth = stage.stageWidth;
            Aligner._PrevStageHeight = stage.stageHeight;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            stage.addEventListener(Event.RESIZE, this.handleChangeResolution);
            Extensions.enabled = true;
            Extensions.noInvisibleAdvance = true;
            FocusManager.alwaysEnableArrowKeys = false;
            FocusManager.disableFocusKeys = true;
            CLIK.disableTextFieldToNullFocusMoves = false;
            arrUIList = new Dictionary();
            this.LoadedWidget = new Dictionary();
            this.LoadedMultiWidget = new Dictionary();
            this.InstCache = new Dictionary();
            this.snappingWidget = new Dictionary();
            this.LoadingWidget = [];
            this.LoadingMultiWidget = [];
            arrEscList = [];
            arrOpenLaterCall = [];
            CustomEventMan.Init(this.stage);
            addEventListener(Event.ENTER_FRAME, this.ConfigUI, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_DOWN, this.onMDown, false, 0, true);
            stage.addEventListener(SimpleTooltipEvent.OPEN, this.onOpenTooltip, false, 0, true);
            stage.addEventListener(SimpleTooltipEvent.CLOSE, this.onCloseTooltip, false, 0, true);
            this.instance = this;
            return;
        }// end function

        public function set focusWindow(param1:MWindow) : void
        {
            this._focusWindow = param1;
            return;
        }// end function

        public function get focusWindow() : MWindow
        {
            return this._focusWindow;
        }// end function

        private function onMDown(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            if (event.target == stage)
            {
                if (this.focusWindow != null)
                {
                    this.focusWindow.NonFocusWindow();
                    this.focusWindow = null;
                }
            }
            else
            {
                _loc_2 = event.target as DisplayObject;
                while (_loc_2 != null)
                {
                    
                    if (_loc_2 is MWindow)
                    {
                        if (_loc_2 == this.focusWindow)
                        {
                            return;
                        }
                        (_loc_2 as MWindow).FocusWindow();
                        break;
                    }
                    _loc_2 = _loc_2.parent;
                }
            }
            return;
        }// end function

        private function ConfigUI(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.ConfigUI, false);
            this.mcFakeModal = new MovieClip();
            var _loc_2:* = new Loader();
            var _loc_3:* = new URLRequest(DisplayMan_FileName);
            var _loc_4:* = new LoaderContext(false, null);
            _loc_2.contentLoaderInfo.addEventListener(Event.COMPLETE, this.handleLoadDisplayMan, false, 0, true);
            _loc_2.load(_loc_3, _loc_4);
            canvasWidget_b = new MovieClip();
            addChild(canvasWidget_b);
            canvasWidget_m = new MovieClip();
            addChild(canvasWidget_m);
            canvasWidget_t = new MovieClip();
            addChild(canvasWidget_t);
            this.mcTooltip.visible = false;
            MMap.coreInstance = this;
            TooltipManager.init(stage);
            stage.addEventListener(TooltipEvent.HIDE, this.onSlotTooltipHide, false, 0, true);
            DataBinding.initialize();
            DataAdapter.initialize();
            WindowManager.init(stage);
            stage.addEventListener(WidgetEvent.OPEN_WIDGET, this.handleOpenWidgetEvent, false, 0, true);
            stage.addEventListener(WidgetEvent.CLOSE_WIDGET, this.handleCloseWidgetEvent, false, 0, true);
            ModalManager.Init(stage);
            DragManager.init(stage);
            stage.addEventListener(DragEvent.DRAG_START, this.handleDragStart, false, 0, true);
            stage.addEventListener(DragEvent.DRAG_END, this.handleDragEnd, false, 0, true);
            stage.addEventListener(DragEvent.DRAG_FORCE_END, this.handleDragForceEnd, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_UP, this.handleStageMouseUp, false, 0, true);
            if (DataAdapter.registerInterface != null)
            {
                DataAdapter.registerInterface(Core_OpenWidget, this.CF_OpenWidget);
                DataAdapter.registerInterface(Core_CloseWidget, this.CF_CloseWidget);
                DataAdapter.registerInterface(Core_CloseAllWidget, this.CF_UnloadWidgetAll);
                DataAdapter.registerInterface(Core_UnloadWidget, this.CF_UnloadWidget);
                DataAdapter.registerInterface(Core_IsOpenWidget, this.CF_IsOpenWidget);
                DataAdapter.registerInterface(Core_IsLoadWidget, this.CF_IsLoadWidget);
                DataAdapter.registerInterface(Core_GetMultiWidgetCount, this.CF_GetMultiWidgetCount);
                DataAdapter.registerInterface(Core_EscWidgetClose, this.CF_EscClose);
                DataAdapter.registerInterface(Core_SetStageEvent, this.CF_SetStageEvent);
                DataAdapter.registerInterface(Core_SetProperty, this.CF_SetProperty);
                DataAdapter.registerInterface(Core_GetProperty, this.CF_GetProperty);
                DataAdapter.registerInterface(Core_SetEvent, this.CF_SetEvent);
                DataAdapter.registerInterface(Core_SetDataProvider, this.CF_SetDataProvider);
                DataAdapter.registerInterface(Core_RemoveDataProvider, this.CF_RemoveDataProvider);
                DataAdapter.registerInterface(Core_GetDataProvider, this.CF_GetDataProvider);
                DataAdapter.registerInterface(Core_SetDataProviderProp, this.CF_SetDataProviderProp);
                DataAdapter.registerInterface(Core_SetListItemPropArray, this.CF_SetListItemProperty_Array);
                DataAdapter.registerInterface(Core_SetListItemProp, this.CF_SetListItemProperty);
                DataAdapter.registerInterface(Core_SetListItemFunc, this.CF_CallListItemFunc);
                DataAdapter.registerInterface(Core_CallFunction, this.CF_CallFunction);
                DataAdapter.registerInterface(Core_SetFocus, this.CF_SetFocus);
                DataAdapter.registerInterface(Core_SetTextFormat, this.CF_SetTextFormat);
                DataAdapter.registerInterface(Core_SetTween, this.CF_SetTween);
                DataAdapter.registerInterface(Core_HitTestEnable, this.CF_HitTestEnable);
                DataAdapter.registerInterface(Core_GetSlotTooltipPosSize, this.CF_GetSlotTooltipPosSize);
                DataAdapter.registerInterface(Core_SlotDragStop, this.CF_StopDrag);
                DataAdapter.registerInterface(Core_GetDragSlotBinding, this.CF_GetDragSlotBinding);
                DataAdapter.registerInterface(Core_GetWidgetInstance, this.CF_GetWidgetInstance);
                DataAdapter.registerInterface(Core_ResetWidgetPosition, this.CF_ResetWidgetPosition);
                DataAdapter.registerInterface(Core_IsOpenTooltip, this.CF_IsOpenTooltip);
                DataAdapter.registerInterface(Core_GetDataProviderArray, this.CF_GetDataProviderArray);
                DataAdapter.registerInterface(Core_SetSpeechBubble, this.CF_SetSpeechBubble);
                DataAdapter.registerInterface(Core_DelSpeechBubble, this.CF_DelSpeechBubble);
                DataAdapter.registerInterface(Core_SetFakeModal, this.CF_SetFakeModal);
                DataAdapter.registerInterface(Core_SetDataProvider_Terms, this.CF_SetDataProvider_Terms);
                DataAdapter.registerInterface(Core_SnapCheck, this.CF_SnapCheck);
                DataAdapter.registerInterface(Core_SetUIAlpha, this.CF_SetUIAlpha);
                DataAdapter.registerInterface(Core_GC, this.CF_GC);
                DataAdapter.registerInterface(Core_RemoveTween, this.CF_RemoveTween);
                DataAdapter.registerInterface(Core_RegShowTooltipEnableState, this.CF_RegShowTooltipEnableState);
                DataAdapter.registerInterface(Core_UnregShowTooltipEnableStatep, this.CF_UnregShowTooltipEnableStatep);
                DataAdapter.registerInterface(Core_UpdateDraggingSlot, this.CF_UpdateDraggingSlot);
                DataAdapter.registerInterface(Core_SetFoward, this.CF_SetFoward);
                DataAdapter.registerInterface(Core_SetHeadData, this.CF_SetHeadData);
                DataAdapter.registerInterface(Core_SetTreeData, this.CF_SetTreeData);
                DataAdapter.registerInterface(Core_GetHeadData, this.CF_GetHeadData);
                DataAdapter.registerInterface(Core_GetTreeData, this.CF_GetTreeData);
                DataAdapter.registerInterface(Core_ChangeHeadData, this.CF_ChangeHeadData);
                DataAdapter.registerInterface(Core_ChangeTreeData, this.CF_ChangeTreeData);
                DataAdapter.registerInterface(Core_CloseTooltipForce, this.CF_CloseTooltipForce);
                DataAdapter.registerInterface(Core_ReleaseGhostIcon, this.CF_ReleaseGhostIcon);
                DataAdapter.registerInterface(Core_CallFunctionObject, this.CF_CallFunctionObject);
                DataAdapter.registerInterface(Core_HitTest, this.CF_HitTest);
            }
            if (DataAdapter.isGameRun != null && DataAdapter.isGameRun() == true)
            {
                ExternalInterface.call("OnCreateCoreComplete");
            }
            return;
        }// end function

        public function OpenCallLater(event:Event = null) : void
        {
            var _loc_3:* = 0;
            var _loc_4:* = 0;
            var _loc_5:* = false;
            var _loc_6:* = false;
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = null;
            var _loc_10:* = null;
            removeEventListener(Event.ENTER_FRAME, this.OpenCallLater);
            var _loc_2:* = 0;
            while (_loc_2 < arrOpenLaterCall.length)
            {
                
                _loc_3 = arrOpenLaterCall[_loc_2].widgetID;
                _loc_4 = arrOpenLaterCall[_loc_2].subID;
                _loc_5 = arrOpenLaterCall[_loc_2].isLoaded;
                _loc_6 = arrOpenLaterCall[_loc_2].isPreload;
                _loc_7 = this.GetLoadedWidget(_loc_3, _loc_4);
                if (_loc_7 == null)
                {
                }
                else
                {
                    _loc_8 = arrUIList[_loc_3];
                    if (_loc_8 == null)
                    {
                    }
                    else
                    {
                        if (_loc_6 == false)
                        {
                            this.AttachUI(_loc_7, _loc_3);
                            if (_loc_8.isWindow == true)
                            {
                                (_loc_7 as MWindow).onWindowSwapToFront(null);
                            }
                        }
                        if (_loc_4 == 0)
                        {
                            if (_loc_5 == true)
                            {
                                if (_loc_8.LoadCompleteCall != "")
                                {
                                    ExternalInterface.call("OnCustomEvent", _loc_8.LoadCompleteCall);
                                }
                            }
                            if (_loc_6 == false)
                            {
                                if (_loc_8.snapping == true)
                                {
                                    this.snappingWidget[_loc_7] = 0;
                                }
                                if (_loc_8.OpenCall != "")
                                {
                                    ExternalInterface.call("OnCustomEvent", _loc_8.OpenCall);
                                }
                            }
                        }
                        else
                        {
                            _loc_9 = [];
                            _loc_10 = [];
                            _loc_9.push(Util.OBJ_TYPE_INT);
                            _loc_10.push(_loc_4);
                            if (_loc_5 == true)
                            {
                                if (_loc_8.LoadCompleteCall != "")
                                {
                                    ExternalInterface.call("OnCustomEvent", _loc_8.LoadCompleteCall, _loc_9, _loc_10);
                                }
                            }
                            if (_loc_6 == false)
                            {
                                if (_loc_8.snapping == true)
                                {
                                    this.snappingWidget[_loc_7] = 0;
                                }
                                if (_loc_8.OpenCall != "")
                                {
                                    ExternalInterface.call("OnCustomEvent", _loc_8.OpenCall, _loc_9, _loc_10);
                                }
                            }
                        }
                    }
                }
                _loc_2++;
            }
            arrOpenLaterCall = [];
            return;
        }// end function

        public function PushOpenLater(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
        {
            if (hasEventListener(Event.ENTER_FRAME) == false)
            {
                addEventListener(Event.ENTER_FRAME, this.OpenCallLater, false, 0, true);
            }
            var _loc_5:* = new Object();
            _loc_5.widgetID = param1;
            _loc_5.subID = param2;
            _loc_5.isLoaded = param3;
            _loc_5.isPreload = param4;
            arrOpenLaterCall.push(_loc_5);
            return;
        }// end function

        public function SwapESCList(param1:DisplayObject) : void
        {
            if (this.focusWindow != null && arrUIList[this.focusWindow.widgetID].escCloseable == true)
            {
                RemoveEscList(param1);
                arrEscList.push(param1);
            }
            return;
        }// end function

        public function WindowCloseESC(param1:int, param2:DisplayObject) : void
        {
            if (arrUIList[param1].escCloseable == true)
            {
                RemoveEscList(param2);
            }
            return;
        }// end function

        public function IsLoadWidget(param1:DisplayObject) : Boolean
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_2:* = null;
            for (_loc_2 in this.LoadedWidget)
            {
                
                if (param1 == _loc_6[_loc_2])
                {
                    return true;
                }
            }
            for (_loc_2 in this.LoadedMultiWidget)
            {
                
                _loc_3 = _loc_6[_loc_2];
                for (_loc_4 in _loc_3)
                {
                    
                    if (param1 == _loc_3[_loc_4])
                    {
                        return true;
                    }
                }
            }
            return false;
        }// end function

        public function LoadWidget(param1:uint, param2:int = 0, param3:Boolean = false) : void
        {
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            if (param2 == 0)
            {
                if (this.isWidgetLoaded(param1) == true || this.isWidgetLoading(param1) == true)
                {
                    return;
                }
            }
            else if (this.isMultiWidgetLoaded(param1, param2) == true || this.isMultiWidgetLoading(param1, param2) == true)
            {
                return;
            }
            var _loc_4:* = arrUIList[param1];
            if (_loc_4 == null)
            {
                return;
            }
            if (_loc_4.isWindow == true)
            {
                this.OpenWindow(param1, param2, param3);
            }
            else
            {
                _loc_5 = new WidgetLoader();
                _loc_6 = new URLRequest(_loc_4.path);
                _loc_7 = new LoaderContext(false, null);
                _loc_5.widgetID = param1;
                _loc_5.xcoord = _loc_4.xcoord;
                _loc_5.ycoord = _loc_4.ycoord;
                _loc_5.subID = param2;
                _loc_5.isPreload = param3;
                _loc_5.contentLoaderInfo.addEventListener(Event.COMPLETE, this.handleWidgetLoadComplete, false, 0, true);
                _loc_5.load(_loc_6, _loc_7);
                this.LoadingWidget.push(param1);
            }
            return;
        }// end function

        public function CloseProc(param1:MovieClip) : void
        {
            if (this.focusWindow == param1)
            {
                this.focusWindow = null;
            }
            if (this.InstCache[param1] != null)
            {
                this.InstCache[param1] = null;
                delete this.InstCache[param1];
            }
            CustomEventMan.RemoveEventRoot(param1);
            return;
        }// end function

        public function UnloadWidget(param1:uint, param2:int, param3:Boolean) : Boolean
        {
            var _loc_7:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (param2 == 0)
            {
                _loc_4 = this.LoadedWidget[param1] as MovieClip;
            }
            else
            {
                _loc_5 = this.LoadedMultiWidget[param1];
                if (_loc_5 == null)
                {
                    return false;
                }
                _loc_4 = _loc_5[param2] as MovieClip;
            }
            if (_loc_4 == null)
            {
                return false;
            }
            if (param3 == false && _loc_4.parent == null)
            {
                return false;
            }
            var _loc_6:* = arrUIList[param1];
            if (_loc_6 == null)
            {
                return false;
            }
            if (_loc_6.saveProp == true && DataAdapter.saveProp != null)
            {
                DataAdapter.saveProp(param1, param2);
            }
            ExternalInterface.call("OnWidgetClose", param1, param2, param3);
            if (_loc_6.isWindow == true)
            {
                (_loc_4 as MWindow).isDeleted = param3;
            }
            _loc_4.removeEventListener(SimpleTooltipEvent.OPEN, this.onOpenTooltip);
            _loc_4.removeEventListener(SimpleTooltipEvent.CLOSE, this.onCloseTooltip);
            if (this.snappingWidget[_loc_4] != null)
            {
                this.snappingWidget[_loc_4] = null;
                delete this.snappingWidget[_loc_4];
            }
            if (param3 == false)
            {
                _loc_4.visible = false;
                if (_loc_6.isModal == true)
                {
                    ModalManager.RemoveChild(_loc_4, _loc_6.layer);
                }
                else
                {
                    _loc_4.parent.removeChild(_loc_4);
                }
            }
            else
            {
                this.CloseProc(_loc_4);
                if (_loc_4.parent != null)
                {
                    if (_loc_6.isModal == true)
                    {
                        ModalManager.RemoveChild(_loc_4, _loc_6.layer);
                    }
                    else
                    {
                        _loc_4.parent.removeChild(_loc_4);
                    }
                }
                if (_loc_6.isWindow == true)
                {
                    (_loc_4 as MWindow).RemoveContent();
                    WindowManager.closeWindowByRef(_loc_4 as MWindow, _loc_6.isModal, _loc_6.layer);
                }
                _loc_4.loaderInfo.loader.unloadAndStop();
                _loc_7 = "";
                if (param2 == 0)
                {
                    this.LoadedWidget[param1] = null;
                    delete this.LoadedWidget[param1];
                    _loc_7 = "Unload UI[ widgetID = " + param1 + " ]";
                }
                else
                {
                    _loc_5[param2] = null;
                    delete _loc_5[param2];
                    _loc_7 = "Unload UI[ widgetID = " + param1 + ", subID = " + param2 + " ]";
                }
                ExternalInterface.call("OnWidgetUnload", param1, param2);
                ExternalInterface.call("OnPrintDebug", _loc_7, 0);
            }
            return true;
        }// end function

        public function OpenWindow(param1:uint, param2:int, param3:Boolean) : void
        {
            if (param2 == 0)
            {
                if (this.isWidgetLoaded(param1) == true || this.isWidgetLoading(param1) == true)
                {
                    return;
                }
            }
            else if (this.isMultiWidgetLoaded(param1, param2) == true || this.isMultiWidgetLoading(param1, param2) == true)
            {
                return;
            }
            var _loc_4:* = arrUIList[param1];
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = WindowManager.spawnWindow(this, param1, param2, _loc_4.path, _loc_4.className, _loc_4.fname, _loc_4.xcoord, _loc_4.ycoord, param3);
            this.PushLoading(param1, param2);
            return;
        }// end function

        public function PushLoading(param1:int, param2:int) : void
        {
            var _loc_3:* = 0;
            var _loc_4:* = null;
            if (param2 == 0)
            {
                this.LoadingWidget.push(param1);
            }
            else
            {
                _loc_3 = 0;
                while (_loc_3 < this.LoadingMultiWidget.length)
                {
                    
                    if (this.LoadingMultiWidget[_loc_3].id == param1)
                    {
                        this.LoadingMultiWidget[_loc_3].list.push(param2);
                        return;
                    }
                    _loc_3++;
                }
                _loc_4 = new Object();
                _loc_4.id = param1;
                _loc_4.list = [param2];
                this.LoadingMultiWidget.push(_loc_4);
            }
            return;
        }// end function

        public function PopLoading(param1:int, param2:int) : void
        {
            var _loc_4:* = 0;
            var _loc_3:* = 0;
            if (param2 == 0)
            {
                _loc_3 = 0;
                while (_loc_3 < this.LoadingWidget.length)
                {
                    
                    if (this.LoadingWidget[_loc_3] == param1)
                    {
                        this.LoadingWidget.splice(_loc_3, 1);
                        return;
                    }
                    _loc_3++;
                }
            }
            else
            {
                _loc_3 = 0;
                while (_loc_3 < this.LoadingMultiWidget.length)
                {
                    
                    if (this.LoadingMultiWidget[_loc_3].id == param1)
                    {
                        _loc_4 = 0;
                        while (_loc_4 < this.LoadingMultiWidget[_loc_3].list.length)
                        {
                            
                            if (this.LoadingMultiWidget[_loc_3].list[_loc_4] == param2)
                            {
                                this.LoadingMultiWidget[_loc_3].list.splice(_loc_4, 1);
                                return;
                            }
                            _loc_4++;
                        }
                    }
                    _loc_3++;
                }
            }
            return;
        }// end function

        public function LoadCompleteProc(param1:DisplayObject, param2:int, param3:int, param4:Boolean) : void
        {
            var _loc_7:* = null;
            this.PopLoading(param2, param3);
            if (param3 == 0)
            {
                if (param1 != null)
                {
                    this.LoadedWidget[param2] = param1;
                }
            }
            else if (param1 != null)
            {
                if (this.LoadedMultiWidget[param2] == null)
                {
                    this.LoadedMultiWidget[param2] = new Dictionary();
                }
                _loc_7 = this.LoadedMultiWidget[param2];
                _loc_7[param3] = param1;
            }
            var _loc_5:* = arrUIList[param2];
            if (_loc_5 == null)
            {
                return;
            }
            var _loc_6:* = "Loaded UI[ " + "widgetID = " + param2 + ", path = " + _loc_5.path + " ]";
            ExternalInterface.call("OnPrintDebug", _loc_6, 0);
            Aligner.WidgetAlign(param1 as MovieClip, _loc_5.align, _loc_5.offsetX, _loc_5.offsetY);
            if (param4 == true)
            {
                param1.visible = false;
            }
            else
            {
                if (_loc_5.escCloseable == true)
                {
                    arrEscList.push(param1);
                }
                ExternalInterface.call("OnWidgetOpen", param2, param3);
            }
            this.PushOpenLater(param2, param3, true, param4);
            return;
        }// end function

        public function AttachUI(param1:DisplayObject, param2:int) : void
        {
            var _loc_3:* = arrUIList[param2];
            if (_loc_3 == null)
            {
                return;
            }
            if (_loc_3.isModal == true)
            {
                ModalManager.AddChild(param1, _loc_3.layer);
            }
            else if (_loc_3.layer == 2)
            {
                canvasWidget_t.addChild(param1);
            }
            else if (_loc_3.layer == 1)
            {
                canvasWidget_m.addChild(param1);
            }
            else
            {
                canvasWidget_b.addChild(param1);
            }
            return;
        }// end function

        private function isWidgetLoading(param1:uint) : Boolean
        {
            var _loc_2:* = false;
            var _loc_3:* = 0;
            while (_loc_3 < this.LoadingWidget.length)
            {
                
                if (this.LoadingWidget[_loc_3] == param1)
                {
                    _loc_2 = true;
                    break;
                }
                _loc_3 = _loc_3 + 1;
            }
            return _loc_2;
        }// end function

        private function isWidgetLoaded(param1:uint) : Boolean
        {
            var _loc_2:* = this.LoadedWidget[param1];
            return _loc_2 == null ? (false) : (true);
        }// end function

        private function isMultiWidgetLoading(param1:int, param2:int) : Boolean
        {
            var _loc_5:* = null;
            var _loc_6:* = 0;
            var _loc_3:* = false;
            var _loc_4:* = 0;
            while (_loc_4 < this.LoadingMultiWidget.length)
            {
                
                if (this.LoadingMultiWidget[_loc_4].id == param1)
                {
                    _loc_5 = this.LoadingMultiWidget[_loc_4].list;
                    if (_loc_5 == null)
                    {
                        break;
                    }
                    _loc_6 = 0;
                    while (_loc_6 < _loc_5.length)
                    {
                        
                        if (_loc_5[_loc_6] == param2)
                        {
                            _loc_3 = true;
                            break;
                        }
                        _loc_6++;
                    }
                    break;
                }
                _loc_4++;
            }
            return _loc_3;
        }// end function

        private function isMultiWidgetLoaded(param1:int, param2:int) : Boolean
        {
            var _loc_3:* = this.LoadedMultiWidget[param1];
            if (_loc_3 == null)
            {
                return false;
            }
            var _loc_4:* = _loc_3[param2];
            return _loc_4 == null ? (false) : (true);
        }// end function

        private function FindInstance(param1:DisplayObject, param2:int, param3:String) : Object
        {
            var _loc_6:* = 0;
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (this.isProcessingUnloadAll == false)
            {
                _loc_5 = this.InstCache[param1];
                if (_loc_5 != null)
                {
                    _loc_4 = _loc_5[param3];
                    if (_loc_4 != null)
                    {
                        return _loc_4;
                    }
                }
            }
            if (param3.length == 0)
            {
                _loc_4 = param1;
            }
            else
            {
                _loc_6 = 0;
                _loc_7 = param3.split(".");
                _loc_8 = null;
                if (arrUIList[param2].isWindow == true)
                {
                    if (_loc_7.length == 1)
                    {
                        _loc_4 = _loc_4[param3];
                    }
                    if (_loc_4 == null || undefined == _loc_4)
                    {
                        _loc_4 = (param1 as MWindow).content;
                        _loc_6 = 0;
                        while (_loc_6 < _loc_7.length)
                        {
                            
                            _loc_8 = _loc_4 as MovieClip;
                            _loc_4 = _loc_4[_loc_7[_loc_6]];
                            if (undefined == _loc_4 || _loc_4 == null)
                            {
                                if (_loc_8 != null)
                                {
                                    _loc_4 = _loc_8.getChildByName(_loc_7[_loc_6]);
                                    if (undefined == _loc_4 || _loc_4 == null)
                                    {
                                        break;
                                    }
                                }
                                else
                                {
                                    break;
                                }
                            }
                            _loc_6++;
                        }
                    }
                }
                else
                {
                    _loc_4 = param1;
                    _loc_6 = 0;
                    while (_loc_6 < _loc_7.length)
                    {
                        
                        _loc_8 = _loc_4 as MovieClip;
                        _loc_4 = _loc_4[_loc_7[_loc_6]];
                        if (undefined == _loc_4 || _loc_4 == null)
                        {
                            if (_loc_8 != null)
                            {
                                _loc_4 = _loc_8.getChildByName(_loc_7[_loc_6]);
                                if (undefined == _loc_4 || _loc_4 == null)
                                {
                                    break;
                                }
                            }
                            else
                            {
                                break;
                            }
                        }
                        _loc_6++;
                    }
                }
            }
            if (this.isProcessingUnloadAll == false)
            {
                if (_loc_5 == null)
                {
                    this.InstCache[param1] = new Dictionary();
                }
                if (_loc_4 != null && undefined != _loc_4)
                {
                    _loc_5[param3] = _loc_4;
                }
                else
                {
                    ErrorLog.PushLog(param3);
                }
            }
            return _loc_4;
        }// end function

        public function SetProperty(param1:DisplayObject, param2:int, param3:String, param4:Object, param5:String) : void
        {
            var _loc_6:* = this.FindInstance(param1, param2, param5);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETPROPERTY, ErrorLog.LOG_INSTANCE);
                return;
            }
            _loc_6[param3] = param4;
            return;
        }// end function

        public function GetProperty(param1:DisplayObject, param2:int, param3:String, param4:String) : Object
        {
            var _loc_5:* = this.FindInstance(param1, param2, param4);
            if (undefined == _loc_5 || _loc_5 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_GETPROPERTY, ErrorLog.LOG_INSTANCE);
                return null;
            }
            return _loc_5[param3];
        }// end function

        public function SetEvent(param1:DisplayObject, param2:int, param3:String, param4:String, param5:Array, param6:Array, param7:String) : void
        {
            if (param3 == "")
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETEVENT, ErrorLog.LOG_EVENT);
                return;
            }
            if (param4 == "")
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETEVENT, ErrorLog.LOG_CALLBACK);
                return;
            }
            var _loc_8:* = this.FindInstance(param1, param2, param7);
            if (undefined == _loc_8 || _loc_8 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_GETPROPERTY, ErrorLog.LOG_INSTANCE);
                return;
            }
            CustomEventMan.RegEvent(param1, _loc_8, param3, param4, param5, param6);
            return;
        }// end function

        public function SetDataProvider(param1:DisplayObject, param2:int, param3:Array, param4:String, param5:Boolean) : void
        {
            var _loc_7:* = 0;
            var _loc_6:* = this.FindInstance(param1, param2, param4);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (param5 == false)
            {
                _loc_6.dataProvider = new DataProvider(param3);
            }
            else
            {
                if (_loc_6.dataProvider == null)
                {
                    _loc_6.dataProvider = new DataProvider();
                }
                _loc_7 = 0;
                while (_loc_7 < param3.length)
                {
                    
                    _loc_6.dataProvider.push(param3[_loc_7]);
                    _loc_7++;
                }
                _loc_6.invalidateData();
            }
            return;
        }// end function

        public function RemoveDataProvider(param1:DisplayObject, param2:int, param3:int, param4:String, param5:Boolean) : void
        {
            var _loc_6:* = this.FindInstance(param1, param2, param4);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_REMOVEDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (param5 == false)
            {
                if (_loc_6.dataProvider == null)
                {
                    return;
                }
                _loc_6.dataProvider.splice(param3, 1);
                _loc_6.invalidateData();
            }
            else
            {
                if (_loc_6.dataProvider == null)
                {
                    return;
                }
                _loc_6.dataProvider.cleanUp();
                _loc_6.invalidateData();
            }
            return;
        }// end function

        public function GetDataProvider(param1:DisplayObject, param2:int, param3:int, param4:String, param5:String) : Object
        {
            var _loc_6:* = this.FindInstance(param1, param2, param5);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_GETDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return null;
            }
            if (_loc_6.dataProvider.length <= param3)
            {
                return null;
            }
            if (param4 == null || param4 == "")
            {
                return _loc_6.dataProvider[param3];
            }
            return _loc_6.dataProvider[param3][param4];
        }// end function

        public function SetDataProviderProp(param1:DisplayObject, param2:int, param3:int, param4:String, param5:Object, param6:String) : void
        {
            var _loc_7:* = this.FindInstance(param1, param2, param6);
            if (undefined == _loc_7 || _loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETDATAPROVIDERPROP, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (_loc_7.dataProvider.length <= param3)
            {
                ErrorLog.PushLog(param3);
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETDATAPROVIDERPROP, ErrorLog.LOG_ITEM_COUNT);
                return;
            }
            _loc_7.dataProvider[param3][param4] = param5;
            var _loc_8:* = new Event(Event.CHANGE);
            _loc_7.dataProvider.dispatchEvent(_loc_8);
            return;
        }// end function

        public function SetListItemProperty(param1:DisplayObject, param2:int, param3:int, param4:String, param5:String, param6:Object, param7:String) : void
        {
            var _loc_8:* = this.FindInstance(param1, param2, param7);
            if (undefined == _loc_8 || _loc_8 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_LISTITEMPROP, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (!_loc_8["_renderers"])
            {
                _loc_8.invalidate(InvalidationType.SIZE, InvalidationType.RENDERERS);
                _loc_8.validateNow();
            }
            if (param3 >= _loc_8["_renderers"].length)
            {
                ErrorLog.PushLog(param3);
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_LISTITEMPROP, ErrorLog.LOG_ITEM_COUNT);
                return;
            }
            _loc_8["_renderers"][param3][param4][param5] = param6;
            if (_loc_8.treeList == false)
            {
                _loc_8.invalidateData();
            }
            else
            {
                _loc_8.refreshTreeData();
            }
            return;
        }// end function

        public function CallListItemFunc(param1:DisplayObject, param2:int, param3:int, param4:String, param5:String, param6:Array, param7:String) : void
        {
            var _loc_8:* = this.FindInstance(param1, param2, param7);
            if (undefined == _loc_8 || _loc_8 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_LISTITEMPROP, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (!_loc_8["_renderers"])
            {
                _loc_8.invalidate(InvalidationType.SIZE, InvalidationType.RENDERERS);
                _loc_8.validateNow();
            }
            if (param3 >= _loc_8["_renderers"].length)
            {
                ErrorLog.PushLog(param3);
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_LISTITEMPROP, ErrorLog.LOG_ITEM_COUNT);
                return;
            }
            var _loc_9:* = _loc_8["_renderers"][param3][param4];
            this.ObjCallFunc(_loc_9, param5, param6);
            if (_loc_8.treeList == false)
            {
                _loc_8.invalidateData();
            }
            else
            {
                _loc_8.refreshTreeData();
            }
            return;
        }// end function

        public function CallFunction(param1:DisplayObject, param2:int, param3:String, param4:Array, param5:String) : void
        {
            var _loc_6:* = this.FindInstance(param1, param2, param5);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_CALLFUNCTION, ErrorLog.LOG_INSTANCE);
                return;
            }
            this.ObjCallFunc(_loc_6, param3, param4);
            return;
        }// end function

        public function CallFunctionObject(param1:DisplayObject, param2:int, param3:String, param4:Object, param5:String) : void
        {
            var _loc_6:* = this.FindInstance(param1, param2, param5);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_CALLFUNCTION, ErrorLog.LOG_INSTANCE);
                return;
            }
            var _loc_7:* = _loc_6;
            _loc_7[param3](param4);
            return;
        }// end function

        public function ObjCallFunc(param1:Object, param2:String, param3:Array) : void
        {
            switch(param3.length)
            {
                case 0:
                {
                    this.callFunction0(param1, param2);
                    break;
                }
                case 1:
                {
                    this.callFunction1(param1, param2, param3[0]);
                    break;
                }
                case 2:
                {
                    this.callFunction2(param1, param2, param3[0], param3[1]);
                    break;
                }
                case 3:
                {
                    this.callFunction3(param1, param2, param3[0], param3[1], param3[2]);
                    break;
                }
                case 4:
                {
                    this.callFunction4(param1, param2, param3[0], param3[1], param3[2], param3[3]);
                    break;
                }
                case 5:
                {
                    this.callFunction5(param1, param2, param3[0], param3[1], param3[2], param3[3], param3[4]);
                    break;
                }
                case 6:
                {
                    this.callFunction6(param1, param2, param3[0], param3[1], param3[2], param3[3], param3[4], param3[5]);
                    break;
                }
                case 7:
                {
                    this.callFunction7(param1, param2, param3[0], param3[1], param3[2], param3[3], param3[4], param3[5], param3[6]);
                    break;
                }
                case 8:
                {
                    this.callFunction8(param1, param2, param3[0], param3[1], param3[2], param3[3], param3[4], param3[5], param3[6], param3[7]);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function callFunction0(param1:Object, param2:String) : void
        {
            var _loc_3:* = param1;
            _loc_3[param2]();
            return;
        }// end function

        public function callFunction1(param1:Object, param2:String, param3:Object) : void
        {
            var _loc_4:* = param1;
            _loc_4[param2](param3);
            return;
        }// end function

        private function callFunction2(param1:Object, param2:String, param3:Object, param4:Object) : void
        {
            var _loc_5:* = param1;
            _loc_5[param2](param3, param4);
            return;
        }// end function

        private function callFunction3(param1:Object, param2:String, param3:Object, param4:Object, param5:Object) : void
        {
            var _loc_6:* = param1;
            _loc_6[param2](param3, param4, param5);
            return;
        }// end function

        private function callFunction4(param1:Object, param2:String, param3:Object, param4:Object, param5:Object, param6:Object) : void
        {
            var _loc_7:* = param1;
            _loc_7[param2](param3, param4, param5, param6);
            return;
        }// end function

        private function callFunction5(param1:Object, param2:String, param3:Object, param4:Object, param5:Object, param6:Object, param7:Object) : void
        {
            var _loc_8:* = param1;
            _loc_8[param2](param3, param4, param5, param6, param7);
            return;
        }// end function

        private function callFunction6(param1:Object, param2:String, param3:Object, param4:Object, param5:Object, param6:Object, param7:Object, param8:Object) : void
        {
            var _loc_9:* = param1;
            _loc_9[param2](param3, param4, param5, param6, param7, param8);
            return;
        }// end function

        private function callFunction7(param1:Object, param2:String, param3:Object, param4:Object, param5:Object, param6:Object, param7:Object, param8:Object, param9:Object) : void
        {
            var _loc_10:* = param1;
            _loc_10[param2](param3, param4, param5, param6, param7, param8, param9);
            return;
        }// end function

        private function callFunction8(param1:Object, param2:String, param3:Object, param4:Object, param5:Object, param6:Object, param7:Object, param8:Object, param9:Object, param10:Object) : void
        {
            var _loc_11:* = param1;
            _loc_11[param2](param3, param4, param5, param6, param7, param8, param9, param10);
            return;
        }// end function

        public function SetFocus(param1:DisplayObject, param2:int, param3:String) : void
        {
            var _loc_4:* = this.FindInstance(param1, param2, param3);
            if (undefined == _loc_4 || _loc_4 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETFOCUS, ErrorLog.LOG_INSTANCE);
                return;
            }
            stage.focus = _loc_4;
            if (_loc_4 is UIComponent)
            {
                _loc_4.FocusIn();
            }
            return;
        }// end function

        public function SetTextFormat(param1:DisplayObject, param2:int, param3:Boolean, param4:uint, param5:Boolean, param6:int, param7:int, param8:int, param9:String) : void
        {
            var _loc_10:* = this.FindInstance(param1, param2, param9);
            if (undefined == _loc_10 || _loc_10 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETTEXTFORMAT, ErrorLog.LOG_INSTANCE);
                return;
            }
            var _loc_11:* = _loc_10.textField.getTextFormat();
            if (!_loc_10.textField.getTextFormat())
            {
                _loc_11 = new TextFormat();
            }
            if (param3 == true)
            {
                _loc_11.color = param4;
            }
            _loc_11.underline = param5;
            if (param6 != -1)
            {
                _loc_11.size = param6;
            }
            if (_loc_10 is TextField)
            {
                if (param7 == 0 && param8 == 0)
                {
                    _loc_10.defaultTextFormat = _loc_11;
                    _loc_10.setTextFormat(_loc_11, 0, _loc_10.textField.length);
                }
                else
                {
                    _loc_10.setTextFormat(_loc_11, param7, param8);
                }
            }
            else
            {
                if (param7 == 0 && param8 == 0)
                {
                    _loc_10.textField.defaultTextFormat = _loc_11;
                    _loc_10.textField.setTextFormat(_loc_11, 0, _loc_10.textField.length);
                }
                else
                {
                    _loc_10.textField.setTextFormat(_loc_11, param7, param8);
                }
                _loc_10.updateText();
            }
            return;
        }// end function

        public function SetTween(param1:DisplayObject, param2:int, param3:int, param4:Object, param5:Object, param6:String) : void
        {
            var _loc_7:* = this.FindInstance(param1, param2, param6);
            if (undefined == _loc_7 || _loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETTWEEN, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (_loc_7._tween != null)
            {
                Tween.removeTween(_loc_7._tween);
            }
            _loc_7._tween = new Tween(param3, _loc_7, param4, param5);
            return;
        }// end function

        public function RemoveTween(param1:DisplayObject, param2:int, param3:String) : void
        {
            var _loc_4:* = this.FindInstance(param1, param2, param3);
            if (undefined == _loc_4 || _loc_4 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETTWEEN, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (_loc_4._tween != null)
            {
                Tween.removeTween(_loc_4._tween);
            }
            return;
        }// end function

        public function HitTestEnable(param1:DisplayObject, param2:int, param3:Boolean, param4:String) : void
        {
            var _loc_5:* = this.FindInstance(param1, param2, param4);
            if (undefined == _loc_5 || _loc_5 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_HITTESTENABLE, ErrorLog.LOG_INSTANCE);
                return;
            }
            InteractiveObjectEx.setHitTestDisable(_loc_5, param3);
            return;
        }// end function

        public function GetWidgetInstance(param1:DisplayObject, param2:int, param3:String) : Object
        {
            var _loc_4:* = this.FindInstance(param1, param2, param3);
            if (undefined == _loc_4 || _loc_4 == null)
            {
                return null;
            }
            return _loc_4;
        }// end function

        private function GetLoadedWidget(param1:int, param2:int) : DisplayObject
        {
            var _loc_4:* = null;
            var _loc_3:* = null;
            if (param2 == 0)
            {
                _loc_3 = this.LoadedWidget[param1];
            }
            else
            {
                _loc_4 = this.LoadedMultiWidget[param1];
                if (_loc_4 != null)
                {
                    _loc_3 = _loc_4[param2];
                }
            }
            return _loc_3;
        }// end function

        public function CF_RegUIList(param1:int, param2:String, param3:String, param4:String, param5:String, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:Boolean, param18:Boolean) : void
        {
            var _loc_19:* = new Widget(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18);
            arrUIList[param1] = _loc_19;
            return;
        }// end function

        public function CF_PreloadUI() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            for (_loc_1 in arrUIList)
            {
                
                _loc_2 = _loc_4[_loc_1];
                this.CF_OpenWidget(_loc_2.id, 0, true);
            }
            return;
        }// end function

        public function CF_UnloadWidgetAll(param1:Boolean) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = 0;
            var _loc_8:* = 0;
            if (param1 == true)
            {
                this.isProcessingUnloadAll = true;
                Tween.removeAllTweens();
            }
            this.focusWindow = null;
            arrEscList = [];
            arrOpenLaterCall = [];
            var _loc_2:* = null;
            var _loc_3:* = null;
            for (_loc_2 in arrUIList)
            {
                
                if (param1 == true)
                {
                    _loc_3 = this.LoadedWidget[_loc_2];
                    if (_loc_3 != null)
                    {
                        this.UnloadWidget(_loc_2 as int, 0, true);
                    }
                }
                else
                {
                    this.CF_CloseWidget(_loc_2 as int, 0);
                }
                _loc_4 = this.LoadedMultiWidget[_loc_2] as Dictionary;
                if (_loc_4 != null)
                {
                    _loc_5 = [];
                    for (_loc_6 in _loc_4)
                    {
                        
                        if (param1 == true)
                        {
                            _loc_5.push(_loc_6 as int);
                            continue;
                        }
                        this.CF_CloseWidget(_loc_2 as int, _loc_6 as int);
                    }
                    _loc_7 = 0;
                    while (_loc_7 < _loc_5.length)
                    {
                        
                        _loc_8 = _loc_5[_loc_7];
                        _loc_3 = _loc_4[_loc_8];
                        if (_loc_3 != null)
                        {
                            this.UnloadWidget(_loc_2 as int, _loc_8, true);
                        }
                        _loc_7++;
                    }
                }
            }
            System.gc();
            this.isProcessingUnloadAll = false;
            return;
        }// end function

        public function CF_UnloadWidget(param1:int, param2:int) : void
        {
            this.UnloadWidget(param1, param2, true);
            return;
        }// end function

        public function CF_OpenWidget(param1:int, param2:int, param3:Boolean = false) : void
        {
            var _loc_4:* = false;
            if (param2 == 0)
            {
                _loc_4 = this.isWidgetLoaded(param1);
            }
            else
            {
                _loc_4 = this.isMultiWidgetLoaded(param1, param2);
            }
            if (_loc_4 == false)
            {
                this.LoadWidget(param1, param2, param3);
                return;
            }
            if (param3 == true)
            {
                return;
            }
            var _loc_5:* = this.GetLoadedWidget(param1, param2);
            if (_loc_5 == null || _loc_5.parent != null)
            {
                return;
            }
            _loc_5.visible = true;
            var _loc_6:* = arrUIList[param1];
            if (_loc_6 == null)
            {
                return;
            }
            if (_loc_6.escCloseable == true)
            {
                arrEscList.push(_loc_5);
            }
            _loc_5.addEventListener(SimpleTooltipEvent.OPEN, this.onOpenTooltip, false, 0, true);
            _loc_5.addEventListener(SimpleTooltipEvent.CLOSE, this.onCloseTooltip, false, 0, true);
            this.PushOpenLater(param1, param2, false, false);
            ExternalInterface.call("OnWidgetOpen", param1, param2);
            return;
        }// end function

        public function CF_CloseWidget(param1:int, param2:int) : void
        {
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_3:* = this.GetLoadedWidget(param1, param2);
            if (_loc_3 == null)
            {
                return;
            }
            if (_loc_3.parent == null)
            {
                return;
            }
            _loc_3.removeEventListener(SimpleTooltipEvent.OPEN, this.onOpenTooltip);
            _loc_3.removeEventListener(SimpleTooltipEvent.CLOSE, this.onCloseTooltip);
            var _loc_4:* = arrUIList[param1];
            if (_loc_4 == null)
            {
                return;
            }
            if (DragManager.inDrag())
            {
                _loc_5 = DragManager.GetDragOriginTarget() as Slot;
                _loc_6 = _loc_5.parent;
                while (_loc_6 != null)
                {
                    
                    if (_loc_6 == _loc_3)
                    {
                        return;
                    }
                    _loc_6 = _loc_6.parent;
                }
            }
            if (_loc_4.escCloseable == true)
            {
                RemoveEscList(_loc_3);
            }
            if (_loc_4.isModal == true)
            {
                this.UnloadWidget(param1, param2, false);
            }
            else
            {
                _loc_3.dispatchEvent(new WidgetEvent(WidgetEvent.CLOSE_WIDGET, true, false, param1, param2));
            }
            return;
        }// end function

        public function CF_IsOpenWidget(param1:int, param2:int) : Boolean
        {
            var _loc_3:* = this.GetLoadedWidget(param1, param2);
            if (_loc_3 == null)
            {
                return false;
            }
            return _loc_3.visible && _loc_3.parent;
        }// end function

        public function CF_IsLoadWidget(param1:int, param2:int) : Boolean
        {
            var _loc_3:* = this.GetLoadedWidget(param1, param2);
            if (_loc_3 == null)
            {
                return false;
            }
            return true;
        }// end function

        public function CF_GetMultiWidgetCount(param1:int) : int
        {
            var _loc_4:* = null;
            var _loc_2:* = this.LoadedMultiWidget[param1];
            if (_loc_2 == null)
            {
                return 0;
            }
            var _loc_3:* = 0;
            for (_loc_4 in _loc_2)
            {
                
                _loc_3++;
            }
            return _loc_3;
        }// end function

        public function CF_IsOpenTooltip() : Boolean
        {
            return TooltipManager.IsOpenTooltip();
        }// end function

        public function CF_EscClose() : Boolean
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = null;
            if (DragManager.inDrag())
            {
                _loc_5 = DragManager.GetDragOriginTarget() as Slot;
                DataAdapter.notifyHoldEnd(_loc_5.binding, _loc_5.lock, null, false, _loc_5.isHold);
                DragManager.StopDrag();
                return true;
            }
            if (arrEscList.length == 0)
            {
                return false;
            }
            var _loc_1:* = arrEscList.pop();
            var _loc_2:* = -1;
            var _loc_3:* = 0;
            for (_loc_4 in this.LoadedWidget)
            {
                
                if (_loc_9[_loc_4] == _loc_1)
                {
                    _loc_2 = _loc_4 as int;
                    break;
                }
            }
            if (_loc_2 == -1)
            {
                for (_loc_4 in this.LoadedMultiWidget)
                {
                    
                    _loc_6 = _loc_9[_loc_4];
                    for (_loc_7 in _loc_6)
                    {
                        
                        if (_loc_6[_loc_7] == _loc_1)
                        {
                            _loc_2 = _loc_4 as int;
                            _loc_3 = _loc_7 as int;
                            break;
                        }
                    }
                    if (_loc_2 != -1)
                    {
                        break;
                    }
                }
            }
            if (_loc_2 == -1)
            {
                return false;
            }
            this.CF_CloseWidget(_loc_2, _loc_3);
            return true;
        }// end function

        public function CF_IsFocusInInput() : Boolean
        {
            if (stage.focus.parent is TextArea || stage.focus.parent is TextInput)
            {
                return true;
            }
            return false;
        }// end function

        public function CF_SetStageEvent(param1:String, param2:String, param3:Array) : void
        {
            if (param1 == "")
            {
                ErrorLog.PrintErrorLog(-1, ErrorLog.TYPE_SETSTAGEEVENT, ErrorLog.LOG_EVENT);
                return;
            }
            CustomEventMan.RegEvent(stage, stage, param1, param2, param3, null);
            return;
        }// end function

        public function CF_SetProperty(param1:int, param2:int, param3:String, param4:Object, param5:String) : void
        {
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETPROPERTY, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_7:* = arrUIList[param1];
            if (_loc_7 == null)
            {
                return;
            }
            this.SetProperty(_loc_6, param1, param3, param4, param5);
            return;
        }// end function

        public function CF_GetProperty(param1:int, param2:int, param3:String, param4:String) : Array
        {
            var _loc_5:* = this.GetLoadedWidget(param1, param2);
            if (_loc_5 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_GETPROPERTY, ErrorLog.LOG_NOT_LOADED);
                return null;
            }
            var _loc_6:* = this.GetProperty(_loc_5, param1, param3, param4);
            var _loc_7:* = [];
            _loc_7.push(Util.GetObjectType(_loc_6));
            _loc_7.push(_loc_6);
            return _loc_7;
        }// end function

        public function CF_SetEvent(param1:int, param2:int, param3:String, param4:String, param5:Array, param6:Array, param7:String) : void
        {
            var _loc_8:* = this.GetLoadedWidget(param1, param2);
            if (_loc_8 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETEVENT, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.SetEvent(_loc_8, param1, param3, param4, param5, param6, param7);
            return;
        }// end function

        public function CF_SetDataProvider(param1:int, param2:int, param3:Array, param4:String, param5:Boolean) : void
        {
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.SetDataProvider(_loc_6, param1, param3, param4, param5);
            return;
        }// end function

        public function CF_SetDataProvider_Terms(param1:int, param2:int, param3:String, param4:Array, param5:Array, param6:Array, param7:Array, param8:Array, param9:Array) : void
        {
            var _loc_12:* = 0;
            var _loc_13:* = 0;
            var _loc_15:* = 0;
            var _loc_16:* = 0;
            var _loc_17:* = 0;
            var _loc_18:* = null;
            var _loc_19:* = 0;
            var _loc_20:* = null;
            var _loc_10:* = this.GetLoadedWidget(param1, param2);
            var _loc_11:* = this.FindInstance(_loc_10, param1, param3);
            if (undefined == _loc_11 || _loc_11 == null)
            {
                return;
            }
            if (_loc_11.dataProvider == null)
            {
                return;
            }
            var _loc_14:* = _loc_11.dataProvider.length;
            _loc_12 = 0;
            while (_loc_12 < _loc_14)
            {
                
                _loc_15 = param4.length;
                _loc_16 = 0;
                _loc_13 = 0;
                while (_loc_13 < _loc_15)
                {
                    
                    if (_loc_11.dataProvider[_loc_12][param4[_loc_13] as String] == param5[_loc_13])
                    {
                        _loc_16 = _loc_16 + 1;
                    }
                    _loc_13++;
                }
                if (_loc_16 == _loc_15)
                {
                    _loc_17 = param7.length;
                    _loc_13 = 0;
                    while (_loc_13 < _loc_17)
                    {
                        
                        _loc_18 = _loc_11.dataProvider[_loc_12];
                        _loc_19 = -1;
                        for (_loc_20 in _loc_18)
                        {
                            
                            if (_loc_20 == param7[_loc_13] as String)
                            {
                                break;
                            }
                            _loc_19 = _loc_19 + 1;
                        }
                        _loc_18[param7[_loc_13] as String] = param8[_loc_13];
                        _loc_13++;
                    }
                    _loc_11.invalidate(InvalidationType.CHANGEPROVIDER_TERMS);
                    _loc_11.validateNow();
                    break;
                }
                _loc_12++;
            }
            return;
        }// end function

        public function CF_RemoveDataProvider(param1:int, param2:int, param3:int, param4:String, param5:Boolean) : void
        {
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_REMOVEDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.RemoveDataProvider(_loc_6, param1, param3, param4, param5);
            return;
        }// end function

        public function CF_GetDataProvider(param1:int, param2:int, param3:int, param4:String, param5:String) : Array
        {
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_GETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return null;
            }
            var _loc_7:* = this.GetDataProvider(_loc_6, param1, param3, param4, param5);
            var _loc_8:* = [];
            _loc_8.push(Util.GetObjectType(_loc_7));
            _loc_8.push(_loc_7);
            return _loc_8;
        }// end function

        public function CF_GetDataProviderArray(param1:int, param2:int, param3:int, param4:Array, param5:String) : Array
        {
            var _loc_9:* = null;
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_GETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return null;
            }
            var _loc_7:* = [];
            var _loc_8:* = 0;
            while (_loc_8 < param4.length)
            {
                
                _loc_9 = this.GetDataProvider(_loc_6, param1, param3, param4[_loc_8], param5);
                if (_loc_9 != null)
                {
                    _loc_7.push(Util.GetObjectType(_loc_9));
                    _loc_7.push(_loc_9);
                }
                _loc_8++;
            }
            return _loc_7;
        }// end function

        public function CF_SetDataProviderProp(param1:int, param2:int, param3:int, param4:String, param5:Object, param6:String) : void
        {
            var _loc_7:* = this.GetLoadedWidget(param1, param2);
            if (_loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDERPROP, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.SetDataProviderProp(_loc_7, param1, param3, param4, param5, param6);
            return;
        }// end function

        public function CF_SetListItemProperty(param1:int, param2:int, param3:int, param4:String, param5:String, param6:Object, param7:String) : void
        {
            var _loc_8:* = this.GetLoadedWidget(param1, param2);
            if (_loc_8 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_LISTITEMPROP, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.SetListItemProperty(_loc_8, param1, param3, param4, param5, param6, param7);
            return;
        }// end function

        public function CF_SetListItemProperty_Array(param1:Array) : void
        {
            var _loc_8:* = null;
            var _loc_2:* = param1[0];
            var _loc_3:* = param1[1];
            var _loc_4:* = param1[2];
            var _loc_5:* = this.GetLoadedWidget(_loc_2, _loc_3);
            if (_loc_5 == null)
            {
                ErrorLog.PrintErrorLog(_loc_2, ErrorLog.TYPE_LISTITEMPROP, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_6:* = _loc_4.length;
            var _loc_7:* = 0;
            while (_loc_7 < _loc_6)
            {
                
                _loc_8 = _loc_4[_loc_7] as Array;
                this.SetListItemProperty(_loc_5, _loc_2, _loc_8[0], _loc_8[1], _loc_8[2], _loc_8[3], _loc_8[4]);
                _loc_7++;
            }
            return;
        }// end function

        public function CF_CallListItemFunc(param1:int, param2:int, param3:int, param4:String, param5:String, param6:Array, param7:String) : void
        {
            var _loc_8:* = this.GetLoadedWidget(param1, param2);
            if (_loc_8 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_LISTITEMPROP, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.CallListItemFunc(_loc_8, param1, param3, param4, param5, param6, param7);
            return;
        }// end function

        public function CF_CallFunction(param1:int, param2:int, param3:String, param4:Array, param5:String) : void
        {
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_CALLFUNCTION, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.CallFunction(_loc_6, param1, param3, param4, param5);
            return;
        }// end function

        public function CF_SetFocus(param1:int, param2:int, param3:String) : void
        {
            if (param1 == -1)
            {
                stage.focus = null;
                return;
            }
            var _loc_4:* = this.GetLoadedWidget(param1, param2);
            if (_loc_4 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETFOCUS, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.SetFocus(_loc_4, param1, param3);
            return;
        }// end function

        public function CF_SetTextFormat(param1:int, param2:int, param3:Boolean, param4:uint, param5:Boolean, param6:int, param7:int, param8:int, param9:String) : void
        {
            var _loc_10:* = this.GetLoadedWidget(param1, param2);
            if (_loc_10 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETTEXTFORMAT, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.SetTextFormat(_loc_10, param1, param3, param4, param5, param6, param7, param8, param9);
            return;
        }// end function

        public function CF_SetTween(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:String, param8:Object, param9:String) : void
        {
            var _loc_12:* = null;
            var _loc_10:* = this.GetLoadedWidget(param1, param2);
            if (_loc_10 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETTWEEN, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_11:* = new Object();
            _loc_11.delay = param4;
            _loc_11.loop = param6;
            switch(param5)
            {
                case 0:
                {
                    _loc_11.ease = Regular.easeOut;
                    break;
                }
                case 1:
                {
                    _loc_11.ease = Regular.easeInOut;
                    break;
                }
                case 2:
                {
                    _loc_11.ease = Regular.easeIn;
                    break;
                }
                case 3:
                {
                    _loc_11.ease = Bounce.easeOut;
                    break;
                }
                case 4:
                {
                    _loc_11.ease = Bounce.easeInOut;
                    break;
                }
                case 5:
                {
                    _loc_11.ease = Bounce.easeIn;
                    break;
                }
                case 6:
                {
                    _loc_11.ease = Back.easeOut;
                    break;
                }
                case 7:
                {
                    _loc_11.ease = Back.easeInOut;
                    break;
                }
                case 8:
                {
                    _loc_11.ease = Back.easeIn;
                    break;
                }
                case 9:
                {
                    _loc_11.ease = Elastic.easeOut;
                    break;
                }
                case 10:
                {
                    _loc_11.ease = Elastic.easeInOut;
                    break;
                }
                case 11:
                {
                    _loc_11.ease = Elastic.easeIn;
                    break;
                }
                case 12:
                {
                    _loc_11.ease = Strong.easeOut;
                    break;
                }
                case 13:
                {
                    _loc_11.ease = Strong.easeInOut;
                    break;
                }
                case 14:
                {
                    _loc_11.ease = Strong.easeIn;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (param7 != null && param7 != "")
            {
                _loc_12 = new Object();
                _loc_12.event = param7;
                _loc_11.data = _loc_12;
                _loc_11.onComplete = this.OnTweenComplete;
            }
            this.SetTween(_loc_10, param1, param3, param8, _loc_11, param9);
            return;
        }// end function

        public function CF_RemoveTween(param1:int, param2:int, param3:String) : void
        {
            var _loc_4:* = this.GetLoadedWidget(param1, param2);
            if (_loc_4 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETTWEEN, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.RemoveTween(_loc_4, param1, param3);
            return;
        }// end function

        public function CF_CallFunctionObject(param1:int, param2:int, param3:String, param4:Object, param5:String) : void
        {
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_CALLFUNCTION, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.CallFunctionObject(_loc_6, param1, param3, param4, param5);
            return;
        }// end function

        public function CF_HitTest(param1:int, param2:int, param3:String) : Boolean
        {
            var _loc_4:* = this.GetLoadedWidget(param1, param2);
            if (_loc_4 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_CALLFUNCTION, ErrorLog.LOG_NOT_LOADED);
                return false;
            }
            var _loc_5:* = this.FindInstance(_loc_4, param1, param3);
            if (undefined == _loc_5 || _loc_5 == null)
            {
                return false;
            }
            return _loc_5.hitTestPoint(stage.mouseX, stage.mouseY, true);
        }// end function

        private function OnTweenComplete(param1:Tween) : void
        {
            if (param1.data.event != null && undefined != param1.data.event)
            {
                ExternalInterface.call("OnCustomEvent", param1.data.event);
            }
            return;
        }// end function

        public function CF_HitTestEnable(param1:int, param2:int, param3:Boolean, param4:String) : void
        {
            var _loc_5:* = this.GetLoadedWidget(param1, param2);
            if (_loc_5 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_HITTESTENABLE, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            this.HitTestEnable(_loc_5, param1, param3, param4);
            return;
        }// end function

        public function CF_StopDrag() : void
        {
            DragManager.StopDrag();
            return;
        }// end function

        public function CF_GetDragSlotBinding() : String
        {
            var _loc_1:* = DragManager.GetDragOriginTarget() as Slot;
            if (_loc_1 == null)
            {
                return "";
            }
            return _loc_1.binding;
        }// end function

        public function CF_GetSlotTooltipPosSize() : Array
        {
            var _loc_1:* = [];
            var _loc_2:* = TooltipManager.GetTooltipRef();
            if (_loc_2 == null)
            {
                _loc_1.push(0);
                _loc_1.push(0);
                _loc_1.push(0);
                _loc_1.push(0);
                return _loc_1;
            }
            _loc_1.push(_loc_2.x);
            _loc_1.push(_loc_2.y);
            var _loc_3:* = _loc_2["bg"];
            if (_loc_3 == null)
            {
                _loc_1.push(0);
                _loc_1.push(0);
                return _loc_1;
            }
            _loc_1.push(_loc_3.width);
            _loc_1.push(_loc_3.height);
            return _loc_1;
        }// end function

        public function CF_GetWidgetInstance(param1:int, param2:int, param3:String) : Object
        {
            var _loc_4:* = this.GetLoadedWidget(param1, param2);
            if (_loc_4 == null)
            {
                return null;
            }
            return this.GetWidgetInstance(_loc_4, param1, param3);
        }// end function

        public function CF_ResetWidgetPosition() : void
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            for (_loc_1 in arrUIList)
            {
                
                _loc_2 = _loc_4[_loc_1];
                Aligner.WidgetAlign(this.LoadedWidget[_loc_1], _loc_2.align, _loc_2.offsetX, _loc_2.offsetY);
            }
            ExternalInterface.call("OnChangeResolution", true);
            return;
        }// end function

        public function CF_SetSpeechBubble(param1:int, param2:int, param3:String, param4:String) : void
        {
            var _loc_5:* = this.GetLoadedWidget(param1, param2);
            if (_loc_5 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETSPEECHBUBBLE, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_6:* = this.FindInstance(_loc_5, param1, param3);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETSPEECHBUBBLE, ErrorLog.LOG_INSTANCE);
                return;
            }
            var _loc_7:* = getDefinitionByName("SpeechBubble") as Class;
            var _loc_8:* = new (getDefinitionByName("SpeechBubble") as Class)() as SpeechBubble;
            (_loc_8).OpenSpeechBubble(param4, _loc_6);
            return;
        }// end function

        public function CF_DelSpeechBubble(param1:int, param2:int, param3:String) : void
        {
            var _loc_4:* = this.GetLoadedWidget(param1, param2);
            if (_loc_4 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETSPEECHBUBBLE, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_5:* = this.FindInstance(_loc_4, param1, param3);
            if (undefined == _loc_5 || _loc_5 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETSPEECHBUBBLE, ErrorLog.LOG_INSTANCE);
                return;
            }
            var _loc_6:* = _loc_5 as MovieClip;
            var _loc_7:* = (_loc_6).getChildByName((_loc_6).name + "_speechbubble") as SpeechBubble;
            (_loc_7).CloseSpeechBubble();
            return;
        }// end function

        public function CF_SetFakeModal(param1:Boolean) : void
        {
            if (param1 == true)
            {
                this.mcFakeModal.graphics.beginFill(0, 0);
                this.mcFakeModal.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
                this.mcFakeModal.graphics.endFill();
                addChildAt(this.mcFakeModal, 0);
            }
            else
            {
                removeChild(this.mcFakeModal);
            }
            return;
        }// end function

        public function CF_SnapCheck(param1:int, param2:int, param3:int, param4:int, param5:int = 0, param6:int = 0) : Array
        {
            var _loc_7:* = this.GetLoadedWidget(param1, param2);
            if (_loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SNAPCHECK, ErrorLog.LOG_NOT_LOADED);
                return null;
            }
            var _loc_8:* = param5 == 0 ? (_loc_7.width) : (param5);
            var _loc_9:* = param6 == 0 ? (_loc_7.height) : (param6);
            return this.DoSnapCheck(_loc_7, _loc_8, _loc_9, param3, param4);
        }// end function

        public function CF_SetUIAlpha(param1:Number) : void
        {
            stage.alpha = param1;
            return;
        }// end function

        public function CF_GC() : void
        {
            System.gc();
            trace("GC Called --------------------");
            return;
        }// end function

        private function handleChangeResolution(event:Event) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            if (this.displayMan != null)
            {
                this.displayMan.ResetSortBoundary();
            }
            for (_loc_2 in arrUIList)
            {
                
                _loc_3 = _loc_8[_loc_2];
                if (_loc_3.saveProp == false)
                {
                    Aligner.WidgetAlign(this.LoadedWidget[_loc_2], _loc_3.align, _loc_3.offsetX, _loc_3.offsetY);
                    continue;
                }
                if (_loc_3.align == 0)
                {
                    continue;
                }
                _loc_4 = this.LoadedWidget[_loc_2] as DisplayObject;
                if (_loc_4 == null)
                {
                    continue;
                }
                _loc_5 = _loc_4.x;
                _loc_6 = _loc_4.y;
                if (_loc_4.x < 0)
                {
                    _loc_5 = 0;
                }
                else if (stage.stageWidth < _loc_4.x + _loc_4.width)
                {
                    _loc_5 = stage.stageWidth - _loc_4.width;
                }
                if (_loc_4.y < 0)
                {
                    _loc_6 = 0;
                }
                else if (stage.stageHeight < _loc_4.y + _loc_4.height)
                {
                    _loc_6 = stage.stageHeight - _loc_4.height;
                }
                _loc_4.x = _loc_5;
                _loc_4.y = _loc_6;
            }
            Aligner._PrevStageWidth = stage.stageWidth;
            Aligner._PrevStageHeight = stage.stageHeight;
            ModalManager.Resolution(stage.stageWidth, stage.stageHeight);
            ExternalInterface.call("OnChangeResolution");
            return;
        }// end function

        protected function onSlotTooltipHide(event:TooltipEvent) : void
        {
            if (TooltipManager._elem == null)
            {
                return;
            }
            if (TooltipManager._elem != event.elem)
            {
                return;
            }
            TooltipManager.hideTooltip(null);
            return;
        }// end function

        private function handleOpenWidgetEvent(event:WidgetEvent) : void
        {
            var _loc_2:* = event.widgetID;
            if (_loc_2 != -1)
            {
                this.LoadWidget(_loc_2, event.subID);
            }
            return;
        }// end function

        private function handleCloseWidgetEvent(event:WidgetEvent) : void
        {
            var _loc_2:* = event.widgetID;
            if (_loc_2 != -1)
            {
                this.UnloadWidget(_loc_2, event.subID, event.isDelete);
            }
            return;
        }// end function

        private function handleDragStart(event:DragEvent) : void
        {
            var _loc_2:* = event.dragTarget as MDragTarget;
            DataAdapter.notifyHoldStart(_loc_2.binding, _loc_2.lock);
            return;
        }// end function

        private function handleDragEnd(event:DragEvent) : void
        {
            var _loc_2:* = event.dragTarget as Slot;
            var _loc_3:* = event.dropTarget as Slot;
            DataAdapter.notifyHoldEnd(_loc_2.binding, _loc_2.lock, _loc_3 ? (_loc_3.binding) : (null), _loc_3 ? (_loc_3.lock) : (false), _loc_2.isHold);
            return;
        }// end function

        private function handleDragForceEnd(event:DragEvent) : void
        {
            var _loc_2:* = event.dragTarget as MDragTarget;
            DataAdapter.notifyHoldEndForce(_loc_2.binding);
            return;
        }// end function

        private function handleStageMouseUp(event:MouseEvent) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (DragManager.inDrag() == true)
            {
                _loc_2 = new Point(mouseX, mouseY);
                _loc_3 = this.getObjectsUnderPoint(_loc_2);
                if (_loc_3.length != 0)
                {
                    return;
                }
                _loc_4 = DragManager.GetDragOriginTarget() as MDragTarget;
                DataAdapter.notifyHoldEndOutside(_loc_4.binding, _loc_4.lock);
            }
            return;
        }// end function

        private function handleWidgetLoadComplete(event:Event) : void
        {
            var _loc_2:* = event.target.loader as WidgetLoader;
            var _loc_3:* = _loc_2.content;
            _loc_3.x = _loc_2.xcoord;
            _loc_3.y = _loc_2.ycoord;
            _loc_2.removeChild(_loc_2.content);
            this.LoadCompleteProc(_loc_3, _loc_2.widgetID, _loc_2.subID, _loc_2.isPreload);
            if (_loc_2.isPreload == false)
            {
                _loc_3.addEventListener(SimpleTooltipEvent.OPEN, this.onOpenTooltip, false, 0, true);
                _loc_3.addEventListener(SimpleTooltipEvent.CLOSE, this.onCloseTooltip, false, 0, true);
            }
            return;
        }// end function

        private function handleLoadDisplayMan(event:Event) : void
        {
            var _loc_2:* = event.target.loader as Loader;
            this.displayMan = _loc_2.content as MDisplayMan;
            addChildAt(this.displayMan, 0);
            return;
        }// end function

        private function onOpenTooltip(event:SimpleTooltipEvent) : void
        {
            this.OpenTooltip(event);
            return;
        }// end function

        private function onCloseTooltip(event:SimpleTooltipEvent) : void
        {
            this.CloseTooltip(event);
            return;
        }// end function

        public function OpenTooltip(event:SimpleTooltipEvent) : void
        {
            if (this.mcTooltip == null)
            {
                return;
            }
            this.mcTooltip.visible = true;
            if (event.htmlText == true)
            {
                this.mcTooltip.OpenTooltip_html(event.tooltip);
            }
            else
            {
                this.mcTooltip.OpenTooltip(event.tooltip);
            }
            this.mcTooltip.component = event.component;
            var _loc_2:* = event.localY + event.component.height + 2;
            if (_loc_2 + this.mcTooltip.height > stage.stageHeight)
            {
                _loc_2 = event.localY - this.mcTooltip.height - 2;
            }
            var _loc_3:* = event.localX;
            if (_loc_3 + this.mcTooltip.width > stage.stageWidth)
            {
                _loc_3 = stage.stageWidth - this.mcTooltip.width;
            }
            PopUpManager.show(this.mcTooltip, _loc_3, _loc_2, this);
            return;
        }// end function

        public function CloseTooltip(event:SimpleTooltipEvent) : void
        {
            if (this.mcTooltip == null)
            {
                return;
            }
            if (event.removeUI == true)
            {
                if (this.mcTooltip.component == event.component)
                {
                    this.mcTooltip.visible = false;
                }
            }
            else
            {
                this.mcTooltip.visible = false;
            }
            return;
        }// end function

        public function CloseTooltipForce() : void
        {
            this.mcTooltip.visible = false;
            return;
        }// end function

        public function snapCheck(param1:DisplayObject, param2:int, param3:int) : Array
        {
            if (this.snappingWidget[param1] == null)
            {
                return [param2, param3];
            }
            return this.DoSnapCheck(param1, param1.width, param1.height, param2, param3);
        }// end function

        private function DoSnapCheck(param1:DisplayObject, param2:int, param3:int, param4:int, param5:int) : Array
        {
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_11:* = 0;
            var _loc_12:* = 0;
            var _loc_13:* = 0;
            var _loc_14:* = 0;
            var _loc_6:* = [param4, param5];
            var _loc_7:* = false;
            var _loc_8:* = false;
            for (_loc_9 in this.snappingWidget)
            {
                
                _loc_10 = _loc_9 as DisplayObject;
                if (_loc_10 == param1)
                {
                    continue;
                }
                _loc_11 = param4 + param2;
                _loc_12 = param5 + param3;
                _loc_13 = _loc_10.x + _loc_10.width;
                _loc_14 = _loc_10.y + _loc_10.height;
                if (_loc_10.x - this.snapPixel < _loc_11 && _loc_13 + this.snapPixel > param4 && _loc_10.y - this.snapPixel < _loc_12 && _loc_14 + this.snapPixel > param5)
                {
                    if (_loc_7 == false)
                    {
                        if (_loc_13 - this.snapPixel < param4 && _loc_13 + this.snapPixel > param4)
                        {
                            _loc_6[0] = _loc_13;
                            _loc_7 = true;
                        }
                        else if (_loc_10.x + this.snapPixel > _loc_11 && _loc_10.x - this.snapPixel < _loc_11)
                        {
                            _loc_6[0] = _loc_10.x - param2;
                            _loc_7 = true;
                        }
                        if (_loc_7 == true)
                        {
                            if (_loc_10.y - this.snapPixel < param5 && _loc_10.y + this.snapPixel > param5)
                            {
                                _loc_6[1] = _loc_10.y;
                                _loc_8 = true;
                            }
                            else if (_loc_14 - this.snapPixel < _loc_12 && _loc_14 + this.snapPixel > _loc_12)
                            {
                                _loc_6[1] = _loc_14 - param3;
                                _loc_8 = true;
                            }
                        }
                    }
                    if (_loc_8 == false)
                    {
                        if (_loc_14 - this.snapPixel < param5 && _loc_14 + this.snapPixel > param5)
                        {
                            _loc_6[1] = _loc_14;
                            _loc_8 = true;
                        }
                        else if (_loc_10.y + this.snapPixel > _loc_12 && _loc_10.y - this.snapPixel < _loc_12)
                        {
                            _loc_6[1] = _loc_10.y - param3;
                            _loc_8 = true;
                        }
                        if (_loc_8 == true)
                        {
                            if (_loc_10.x - this.snapPixel < param4 && _loc_10.x + this.snapPixel > param4)
                            {
                                _loc_6[0] = _loc_10.x;
                                _loc_7 = true;
                            }
                            else if (_loc_13 - this.snapPixel < _loc_11 && _loc_13 + this.snapPixel > _loc_11)
                            {
                                _loc_6[0] = _loc_13 - param2;
                                _loc_7 = true;
                            }
                        }
                    }
                }
                if (_loc_7 == true && _loc_8 == true)
                {
                    break;
                }
            }
            return _loc_6;
        }// end function

        public function CF_RegShowTooltipEnableState(param1:int, param2:int, param3:String, param4:Object, param5:Object, param6:Boolean) : void
        {
            var _loc_7:* = this.GetLoadedWidget(param1, param2);
            if (_loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETPROPERTY, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_8:* = arrUIList[param1];
            if (_loc_8 == null)
            {
                return;
            }
            this.RegShowTooltipEnableState(_loc_7, param1, param3, param4, param5, param6);
            return;
        }// end function

        public function CF_UnregShowTooltipEnableStatep(param1:int, param2:Object, param3:String) : void
        {
            var _loc_4:* = this.GetLoadedWidget(param1, 0);
            if (_loc_4 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETPROPERTY, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_5:* = arrUIList[param1];
            if (_loc_5 == null)
            {
                return;
            }
            this.UnregShowTooltipEnableStatep(_loc_4, param1, param3);
            return;
        }// end function

        public function CF_UpdateDraggingSlot(param1:Object) : void
        {
            var _loc_2:* = DragManager.GetDragOriginTarget() as Slot;
            if (_loc_2 == null)
            {
                return;
            }
            var _loc_3:* = DragManager.GetDragTarget() as Slot;
            if (_loc_3 == null)
            {
                return;
            }
            _loc_3.data = param1;
            return;
        }// end function

        public function CF_SetFoward(param1:int, param2:int) : void
        {
            var _loc_3:* = this.GetLoadedWidget(param1, param2);
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = _loc_3.parent as MovieClip;
            if (_loc_4 == null)
            {
                return;
            }
            _loc_4.removeChild(_loc_3);
            _loc_4.addChild(_loc_3);
            return;
        }// end function

        public function CF_SetHeadData(param1:int, param2:int, param3:Array, param4:String) : void
        {
            var _loc_5:* = this.GetLoadedWidget(param1, param2);
            if (_loc_5 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_6:* = this.FindInstance(_loc_5, param1, param4);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return;
            }
            _loc_6.headDataProvider = new DataProvider(param3);
            return;
        }// end function

        public function CF_SetTreeData(param1:int, param2:int, param3:Array, param4:Array, param5:String) : void
        {
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_7:* = this.FindInstance(_loc_6, param1, param5);
            if (undefined == _loc_7 || _loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (param3.length != param4.length)
            {
                ExternalInterface.call("OnPrintDebug", "CF_SetTreeData - Key and Data is mismatching.", 1);
                return;
            }
            var _loc_8:* = new Dictionary();
            var _loc_9:* = 0;
            while (_loc_9 < param3.length)
            {
                
                _loc_8[param3[_loc_9]] = param4[_loc_9];
                _loc_9++;
            }
            _loc_7.mapTreeData = _loc_8;
            _loc_7.validateNow();
            return;
        }// end function

        public function CF_GetHeadData(param1:int, param2:int, param3:int, param4:String) : Array
        {
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_5:* = this.GetLoadedWidget(param1, param2);
            if (_loc_5 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return null;
            }
            var _loc_6:* = this.FindInstance(_loc_5, param1, param4);
            if (undefined == _loc_6 || _loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return null;
            }
            if (_loc_6.headDataProvider.length <= param3)
            {
                return null;
            }
            var _loc_7:* = _loc_6.headDataProvider[param3];
            if (_loc_7 == null)
            {
                return null;
            }
            var _loc_8:* = new Array();
            for (_loc_9 in _loc_7)
            {
                
                _loc_10 = new Object();
                _loc_10.type = Util.GetObjectType(_loc_7[_loc_9]);
                _loc_10.name = _loc_9 as String;
                _loc_10.value = _loc_7[_loc_9];
                _loc_8.push(_loc_10);
            }
            return _loc_8;
        }// end function

        public function CF_GetTreeData(param1:int, param2:int, param3:String, param4:int, param5:String) : Array
        {
            var _loc_11:* = null;
            var _loc_12:* = null;
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return null;
            }
            var _loc_7:* = this.FindInstance(_loc_6, param1, param5);
            if (undefined == _loc_7 || _loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return null;
            }
            var _loc_8:* = _loc_7.mapTreeData[param3] as Array;
            if (_loc_8 == null)
            {
                return null;
            }
            var _loc_9:* = _loc_8[param4];
            if (_loc_9 == null)
            {
                return null;
            }
            var _loc_10:* = new Array();
            for (_loc_11 in _loc_9)
            {
                
                _loc_12 = new Object();
                _loc_12.type = Util.GetObjectType(_loc_9[_loc_11]);
                _loc_12.name = _loc_11;
                _loc_12.value = _loc_9[_loc_11];
                _loc_10.push(_loc_12);
            }
            return _loc_10;
        }// end function

        public function CF_ChangeHeadData(param1:int, param2:int, param3:int, param4:Object, param5:String) : void
        {
            var _loc_6:* = this.GetLoadedWidget(param1, param2);
            if (_loc_6 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_7:* = this.FindInstance(_loc_6, param1, param5);
            if (undefined == _loc_7 || _loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return;
            }
            _loc_7.headDataProvider[param3] = param4;
            _loc_7.invalidateData();
            return;
        }// end function

        public function CF_ChangeTreeData(param1:int, param2:int, param3:String, param4:int, param5:Object, param6:String) : void
        {
            var _loc_7:* = this.GetLoadedWidget(param1, param2);
            if (_loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_NOT_LOADED);
                return;
            }
            var _loc_8:* = this.FindInstance(_loc_7, param1, param6);
            if (undefined == _loc_8 || _loc_8 == null)
            {
                ErrorLog.PrintErrorLog(param1, ErrorLog.TYPE_SETDATAPROVIDER, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (_loc_8.mapTreeData[param3] == null)
            {
                trace("CF_ChangeTreeData - Invalid Key");
                return;
            }
            _loc_8.mapTreeData[param3][param4] = param5;
            return;
        }// end function

        public function CF_CloseTooltipForce() : void
        {
            this.CloseTooltipForce();
            return;
        }// end function

        public function CF_ReleaseGhostIcon() : void
        {
            var _loc_1:* = DragManager.GetDragOriginTarget() as MDragTarget;
            if (_loc_1 != null)
            {
                _loc_1.removeIconGhost();
            }
            return;
        }// end function

        public function RegShowTooltipEnableState(param1:DisplayObject, param2:int, param3:String, param4:Object, param5:Object, param6:Boolean) : void
        {
            var _loc_8:* = null;
            if (param4 == null)
            {
                return;
            }
            var _loc_7:* = this.FindInstance(param1, param2, param3);
            if (undefined == _loc_7 || _loc_7 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETPROPERTY, ErrorLog.LOG_INSTANCE);
                return;
            }
            _loc_7["tooltip"] = param4;
            _loc_7["subTooltip"] = param5;
            dispatchEvent(new TooltipEvent(TooltipEvent.REGISTER_ELEMENT, true, false, _loc_7));
            if (param6)
            {
                _loc_8 = _loc_7 as MovieClip;
                _loc_8.dispatchEvent(new MouseEvent(MouseEvent.ROLL_OVER));
            }
            return;
        }// end function

        public function UnregShowTooltipEnableStatep(param1:DisplayObject, param2:int, param3:String) : void
        {
            var _loc_4:* = this.FindInstance(param1, param2, param3);
            if (undefined == _loc_4 || _loc_4 == null)
            {
                ErrorLog.PrintErrorLog(param2, ErrorLog.TYPE_SETPROPERTY, ErrorLog.LOG_INSTANCE);
                return;
            }
            if (_loc_4["tooltip"] != null)
            {
                _loc_4["tooltip"] = null;
            }
            dispatchEvent(new TooltipEvent(TooltipEvent.UNREGISTER_ELEMENT, true, false, _loc_4));
            return;
        }// end function

        protected function CopyArray(param1:Array) : Array
        {
            var _loc_2:* = new Array();
            var _loc_3:* = 0;
            while (_loc_3 < param1.length)
            {
                
                _loc_2.push(param1[_loc_3]);
                _loc_3++;
            }
            return _loc_2;
        }// end function

        private function TestUI() : void
        {
            this.CF_RegUIList(0, "Club.swf", "Window.swf", "test", "", "", true, false, false, false, 100, 100, 1, 0, 0, 0, false, false);
            this.CF_OpenWidget(0, 0);
            return;
        }// end function

        public static function RemoveEscList(param1:Object) : void
        {
            var _loc_2:* = 0;
            while (_loc_2 < arrEscList.length)
            {
                
                if (param1 == arrEscList[_loc_2])
                {
                    arrEscList.splice(_loc_2, 1);
                    break;
                }
                _loc_2++;
            }
            return;
        }// end function

    }
}
