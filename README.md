# exter-lib
## [QBCORE] LIBRARY UI LIKE NOPIXEL 4.0


# PREVIEW

## NOTIFY
![notify1](https://github.com/user-attachments/assets/2195080e-eca2-4459-b89e-6942bb606fc7)
![notify2](https://github.com/user-attachments/assets/e46e29be-b289-4a6d-86ee-f2f27d20fea6)
![notify3](https://github.com/user-attachments/assets/52f8eabf-d83e-423d-a58e-bf2781fa05f0)

## PROGRESSBAR
![progressbar](https://github.com/user-attachments/assets/51435838-993e-4753-9119-62b82692882c)

## TABLE INFORMATION
![info](https://github.com/user-attachments/assets/69b457d1-95cb-4d28-bd80-7ab653c26a5f)



## QB Notify example edit

Open qb-core/client/functions.lua, find the QBCore.Functions.Progressbar function and replace it with the following

```
function QBCore.Functions.Notify(text, texttype, length)
    length = length or 5000
    texttype = texttype or 'info'

    if texttype == "primary" then 
        texttype = "info"
    end

    TriggerEvent('exter-lib:notify', text , length, texttype)
end
```

## QB Noitfy Example usage :
```lua
    QBCore.Functions.Notify("Test", "error")
```

## QB Progressbar edit

Open qb-core/client/functions.lua, find the QBCore.Functions.Progressbar function and replace it with the following

```
function QBCore.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if GetResourceState('exter-lib') ~= 'started' then error('progressbar needs to be started in order for QBCore.Functions.Progressbar to work') end
    exports['exter-lib']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish then
                onFinish()
            end
        else
            if onCancel then
                onCancel()
            end
        end
    end)
end
```

# QB Progressbar Example usage:
```
QBCore.Functions.Progressbar("search_register", "Searching Register", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {}, {}, {}, function() -
        QBCore.Functions.Notify("You have searched the register", "success")
    end, function() 
        QBCore.Functions.Notify("You have stopped searching the register", "error")
end)
```

## INFO BAR

- CLIENT

      OPEN > TriggerEvent('exter-lib:openinfo', "Get Car" , "Go to motel and take car.")
      CLOSE > TriggerEvent('exter-lib:closeinfo')

- SERVER

      OPEN > TriggerClientEvent('exter-lib:openinfo', source,"Get Car" , "Go to motel and take car.")
      CLOSE > TriggerClientEvent('exter-lib:closeinfo', source)


