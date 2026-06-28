package com.leanspace.leanspace

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.util.Log
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
            try {
                val views = RemoteViews(context.packageName, R.layout.leanspace_widget)
                val streak = widgetData.getInt(KEY_STREAK, 0)
                val tasksDone = widgetData.getInt(KEY_TASKS_DONE, 0)
                val tasksTotal = widgetData.getInt(KEY_TASKS_TOTAL, 0)
                val habitsDone = widgetData.getInt(KEY_HABITS_DONE, 0)
                val habitsTotal = widgetData.getInt(KEY_HABITS_TOTAL, 0)

                views.setTextViewText(R.id.widget_streak, streak.toString())
                views.setTextViewText(R.id.widget_tasks, "$tasksDone/$tasksTotal tasks")
                views.setTextViewText(R.id.widget_habits, "$habitsDone/$habitsTotal habits")

                val openApp = HomeWidgetLaunchIntent.getActivity(
                    context,
                    MainActivity::class.java,
                )
                views.setOnClickPendingIntent(R.id.widget_root, openApp)

                appWidgetManager.updateAppWidget(widgetId, views)
            } catch (t: Throwable) {
                // Never let a widget update kill the host launcher; log and
                // leave the previous RemoteViews in place.
                Log.e(TAG, "onUpdate failed for widget $widgetId", t)
            }
        }
    }

    private companion object {
        const val TAG = "LeanSpaceWidget"
        const val KEY_STREAK = "streak"
        const val KEY_TASKS_DONE = "tasks_done"
        const val KEY_TASKS_TOTAL = "tasks_total"
        const val KEY_HABITS_DONE = "habits_done"
        const val KEY_HABITS_TOTAL = "habits_total"
    }
}
