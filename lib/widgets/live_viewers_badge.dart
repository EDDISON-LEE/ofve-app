import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LiveViewersBadge extends StatefulWidget {
  final String offerId;
  const LiveViewersBadge({super.key, required this.offerId});

  @override
  State<LiveViewersBadge> createState() => _LiveViewersBadgeState();
}

class _LiveViewersBadgeState extends State<LiveViewersBadge> {
  final _supabase = Supabase.instance.client;
  RealtimeChannel? _channel;
  int _viewersCount = 1; // Empieza en 1 (tú mismo)

  @override
  void initState() {
    super.initState();
    _joinChannel();
  }

  void _joinChannel() {
    final userId = _supabase.auth.currentUser?.id ?? 'anon';

    _channel = _supabase.channel('room_${widget.offerId}');

    _channel!.onPresenceSync((payload) {
      // FIX API 2.13.2: presenceState() devuelve List<SinglePresenceState>,
      // no List<Presence>. La longitud sigue siendo el número de
      // conexiones activas en la sala (mismo comportamiento que antes).
      final int viewers = _channel!.presenceState().length;
      if (mounted) {
        setState(() {
          _viewersCount = viewers < 1 ? 1 : viewers;
        });
      }
    }).subscribe((status, error) async {
      if (status == RealtimeSubscribeStatus.subscribed) {
        await _channel!.track({
          'user_id': userId,
          'online_at': DateTime.now().toIso8601String(),
        });
      }
    });
  }

  @override
  void dispose() {
    _channel?.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_viewersCount <= 1) return const SizedBox.shrink(); // Si estás solo, no se muestra

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6), // <-- withOpacity deprecado → withValues
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.visibility, color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(
            '$_viewersCount personas viendo esto',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}