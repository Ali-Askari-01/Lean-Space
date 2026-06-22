package com.leanspace.leanspace

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

/**
 * Read-mostly home-screen widget showing the current chain streak plus today's
 * task and habit progress. Tapping opens the app; the + opens the app to add a
 * task.
 */
class LeanSpaceWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences,
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.leanspace_widget).apply {
                val streak = widgetData.getInt("streak", 0)
                val tasksDone = widgetData.getInt("tasks_done", 0)
                val tasksTotal = widgetData.getInt("tasks_total", 0)
                val habitsDone = widgetData.getInt("habits_done", 0)
                val habitsTotal = widgetData.getInt("habits_total", 0)

                setTextViewText(R.id.widget_streak, streak.toString())
                setTextViewText(R.id.widget_tasks, "$tasksDone/$tasksTotal tasks")
                setTextViewText(R.id.widget_habits, "$habitsDone/$habitsTotal habits")

                val openApp = HomeWidgetLaunchIntent.getActivity(
                    context,
                    MainActivity::class.java,
                )
                setOnClickPendingIntent(R.id.widget_root, openApp)

                val addTask = HomeWidgetLaunchIntent.getActivity(
                    context,
                    MainActivity::class.java,
                    Uri.parse("leanspace://add-task"),
                )
                setOnClickPendingIntent(R.id.widget_add, addTask)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
